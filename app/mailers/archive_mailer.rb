class ArchiveMailer < ApplicationMailer
  include AbstractController::Callbacks
  include ArchivesHelper

  attr_accessor :attr_archive, :attr_sending_user

  default template_path: 'archive_mailer' # to make sure that your mailer uses the devise views
  default from: Rails.application.secrets.email_provider_username
  default cc: Rails.application.secrets.email_provider_username

  after_action :attach_metadata

  def link_archive_show_uuid(archive, recipient, sending_user)
    @attr_archive = archive
    @attr_sending_user = sending_user

    @archive = archive
    @recipient = recipient
    @archive_fullname = "#{@archive.fullname}" # "#{archive_info_legend(@archive)}"
    @archive_url_uuid = Rails.application.routes.url_helpers.url_for(only_path: false, controller: 'archives', action: 'show_uuid', uuid: @archive.archive_uuid, locale: locale)

    attachments.inline['logo_mailer'] = File.read("app/assets/images/logo_mailer.png")
    attachments.inline['logo_uke'] = File.read("app/assets/images/logo_uke_pl_do_lewej_small.png")

    mail(to: @recipient.email, subject: "#{t('title')} - #{@archive_fullname}" )
  end

  private

    def attach_metadata
      mailer_klass = self.class.to_s
      mailer_action = self.action_name
      mailer_archive = @attr_archive
      mailer_sending_user = @attr_sending_user

      self.message.instance_variable_set(:@mailer_klass, mailer_klass)
      self.message.instance_variable_set(:@mailer_action, mailer_action)
      self.message.instance_variable_set(:@mailer_archive, mailer_archive)
      self.message.instance_variable_set(:@mailer_sending_user, mailer_sending_user)

      self.message.class.send(:attr_reader, :mailer_klass)
      self.message.class.send(:attr_reader, :mailer_action)
      self.message.class.send(:attr_reader, :mailer_archive)
      self.message.class.send(:attr_reader, :mailer_sending_user)
    end
end


# preview
# http://localhost:3000/rails/mailers/status_mailer/project_status_email.html