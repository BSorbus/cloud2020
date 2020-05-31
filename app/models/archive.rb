class Archive < ApplicationRecord
  include ActionView::Helpers::TextHelper

  delegate :url_helpers, to: 'Rails.application.routes'

  # relations
  belongs_to :author, class_name: "User"

  has_many :archivizations, dependent: :destroy
  has_many :accesses_groups, through: :archivizations, source: :group

  has_many :components, as: :componentable, dependent: :destroy
  has_many :works, as: :trackable
 
  # validates
  validates :name, presence: true,
                    length: { in: 1..75 },
                    uniqueness: { case_sensitive: false }

  validates :note, length: { in: 0..500 }

  validate :expiry_on_after_today
  validates :expiry_on, presence: true

  validates :archivizations, presence: true

  # callbacks
  before_validation :set_initial_data, on: :create

  # additionals
  accepts_nested_attributes_for :archivizations, reject_if: :all_blank, allow_destroy: true


  def self.for_user_in_archivizations(u)
    eager_load(archivizations: [group: :users])
      .where( archivizations: {groups: {members: {user_id: [u]} } } )  
  end

  def log_work(action = '', action_user_id = nil)
    worker_id = action_user_id || self.author_id
    url = "<a href=#{url_helpers.show_uuid_archive_path(self.archive_uuid, locale: :pl)}>#{self.fullname}</a>".html_safe

    Work.create!(trackable_type: 'Archive', trackable_id: self.id, action: "#{action}", author_id: worker_id, url: "#{url}", 
      parameters: self.to_json(except: [:author_id], include: {archivizations: {only: [:id], include: { group: {only: [:id, :name]}, 
                                                                                                      archivization_type: {only: [:id, :name]}} }, 
                  author: {only: [:id, :user_name, :email]}}
      )
    )
  end


  def log_work_send_email(action = '', action_user_id = nil, recipients = nil)
    worker_id = action_user_id || self.author_id

    # puts recipients.class         #Mail::AddressContainer
    # puts recipients.first         #jan.kowalski@email.com
    # puts recipients.first.class   #String

    recipient = User.find_by(email: recipients.first)
    recipient_str = recipient.to_json(only: [:id, :user_name, :first_name, :last_name, :email], include: {author: {only: [:id, :user_name, :email]}}, root: 'recipient')
    recipient_hash = JSON.parse(recipient_str)
 
    archive_str = self.to_json( except: [:author_id], include: {author: {only: [:id, :user_name, :email]} }, root: 'archive' )
    archive_hash = JSON.parse(archive_str)

    # save for Archive Object
    archive_with_recipient_hash = archive_hash.merge(recipient_hash)
    archive_with_recipient_json = archive_with_recipient_hash.to_json 

    # url_archive = eval( "url_helpers.link_to( #{self.fullname}, archive_path(#{self.id}, locale: :pl), remote: false)")
    url_archive = "<a href=#{url_helpers.show_uuid_archive_path(uuid: self.archive_uuid, locale: :pl)}>#{self.fullname}</a>".html_safe
    Work.create!(trackable_type: 'Archive', trackable_id: self.id, action: "#{action}", author_id: worker_id, url: "#{url_archive}", parameters: archive_with_recipient_json)

    # save for User Object
    recipient_with_archive_hash = recipient_hash.merge(archive_hash)
    recipient_with_archive_json = recipient_with_archive_hash.to_json 

    # url_user = eval( "url_helpers.link_to( #{self.fullname}, user_path(#{recipient.id}, locale: :pl), remote: false)")
    url_user = "<a href=#{url_helpers.user_path(recipient.id, locale: :pl)}>#{recipient.fullname}</a>".html_safe
    Work.create!(trackable_type: 'User', trackable_id: recipient.id, action: "#{action}", author_id: worker_id, url: "#{url_user}", parameters: recipient_with_archive_json)

  end


  def fullname
    "#{name}"
  end

  def note_truncate
    truncate(Loofah.fragment(self.note).text, length: 250)
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
      self.archive_uuid ||= SecureRandom.uuid unless self.archive_uuid.present?
    end 

    def expiry_on_after_today
      return if expiry_on.blank?
     
      if expiry_on < Time.zone.today
        errors.add(:expiry_on, I18n.t('errors.messages.greater_than_or_equal_to', count: Time.zone.today.strftime('%Y-%m-%d')  ) ) 
        throw :abort 
      end 
    end
end
