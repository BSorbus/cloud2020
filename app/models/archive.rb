class Archive < ApplicationRecord
  include ActionView::Helpers::TextHelper

  # relations
  belongs_to :author, class_name: "User"

  has_many :archivizations, dependent: :destroy
  has_many :accesses_groups, through: :archivizations, source: :group

#  has_many :components, as: :componentable, dependent: :destroy
  has_many :works, as: :trackable
 
  # validates
  validates :name, presence: true,
                    length: { in: 1..100 },
                    uniqueness: { case_sensitive: false }

  validates :archivizations, presence: true

  # callbacks
  after_initialize :set_initial_data
  after_create_commit { self.log_work('create') }
  after_update_commit { self.log_work('update') }

  # additionals
  accepts_nested_attributes_for :archivizations, reject_if: :all_blank, allow_destroy: true


  def self.for_user_in_archivizations(u)
    eager_load(archivizations: [group: :users])
      .where( archivizations: {groups: {members: {user_id: [u]} } } )  
  end



  def log_work(action = '', action_user_id = nil)
    worker_id = action_user_id || self.author_id

    Work.create!(trackable_type: 'Archive', trackable_id: self.id, action: "#{action}", author_id: worker_id, 
      parameters: self.to_json(except: [:user_id], 
        include: {archivizations: {only: [:id], include: {group: {only: [:id, :name]}, archivization_type: {only: [:id, :name]}} }, 
                  author: {only: [:id, :user_name, :email]}}
      )
    )
  end

  def fullname
    "#{name}"
  end

  def note_truncate
    truncate(Loofah.fragment(self.note).text, length: 100)
  end

  def components_folders_count
    1
  end

  def components_files_count
    2
  end

  def components_files_size_sum
    1234567890
  end

  private
  
    def set_initial_data
      self.archive_uuid = SecureRandom.uuid unless self.archive_uuid.present?
    end 

end
