class User < ApplicationRecord
  include ActionView::Helpers::TextHelper # for truncate

  devise :saml_authenticatable, :trackable

  # relations
  # has_and_belongs_to_many :roles
  has_many :approvals #, dependent: :destroy
  has_many :roles, through: :approvals


  has_many :members #, dependent: :destroy
  has_many :groups, through: :members

  belongs_to :author, class_name: "User", optional: true
  has_many :works, as: :trackable

  # validates
  validates :user_name, presence: true,
                    length: { in: 1..100 }

  validates :email, presence: true,
                    length: { in: 1..100 },
                    uniqueness: { case_sensitive: false }

  # callbacks
  before_save do
    self.email.downcase! if self.email
  end
  after_commit :set_default_role, on: :create


  def set_default_role
    # role = CreateRoleService.new.proposal_writer
    # self.roles << role 
  end
  
  def log_work(action = '', action_user_id = nil)
    worker_id = action_user_id || self.author_id

    Work.create!(trackable_type: 'User', trackable_id: self.id, action: "#{action}", author_id: worker_id, 
      parameters: self.to_json(except: [:author_id], include: {author: {only: [:id, :user_name, :email]}}))
  end

  def log_work_members(action = '', action_user_id = nil)
    worker_id = action_user_id || self.author_id

    Work.create!(trackable_type: 'User', trackable_id: self.id, action: "#{action}", author_id: worker_id, 
      parameters: self.to_json(only: [:user_name, :email], include: { members: {only: [:created_at], include: {group: {only: [:name]}, 
                                                          author: {only: [:id, :user_name, :email]}}} }))
  end

  def log_work_approvals(action = '', action_user_id = nil)
    worker_id = action_user_id || self.author_id

    Work.create!(trackable_type: 'User', trackable_id: self.id, action: "#{action}", author_id: worker_id, 
      parameters: self.to_json(only: [:user_name, :email], include: { approvals: {only: [:created_at], include: {role: {only: [:name]}, 
                                                          author: {only: [:id, :user_name, :email]}}} }))
  end

  def name
    "#{first_name} #{last_name}"
  end

  def fullname
    "#{name} (#{email})"
  end

  def note_truncate
    truncate(Loofah.fragment(self.note).text, length: 100)
  end

end
