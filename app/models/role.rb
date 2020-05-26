class Role < ApplicationRecord
  include ActionView::Helpers::TextHelper # for truncate

  # relations
  has_many :approvals, dependent: :destroy
  has_many :users, through: :approvals


  belongs_to :author, class_name: "User"
  has_many :works, as: :trackable

  # validates
  validates :name, presence: true,
                    length: { in: 1..100 },
                    uniqueness: { case_sensitive: false }

  validates :note, length: { in: 0..500 }

  # callbacks


  def log_work(action = '', action_user_id = nil)
    worker_id = action_user_id || self.author_id

    Work.create!(trackable_type: 'Role', trackable_id: self.id, action: "#{action}", author_id: worker_id, 
      parameters: self.to_json(except: [:author_id], include: {author: {only: [:id, :user_name, :email]}}))
  end

  def fullname
    "#{name}"
  end

  def note_truncate
    truncate(Loofah.fragment(self.note).text, length: 100)
  end

end
