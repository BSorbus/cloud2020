class ArchiveMailer < ApplicationMailer
  include ArchivesHelper
  default template_path: 'archive_mailer' # to make sure that your mailer uses the devise views
  default from: Rails.application.secrets.email_provider_username
  default cc: Rails.application.secrets.email_provider_username

  def link_archive_show_uuid(archive, recipient)
    @archive = archive
    @recipient = recipient
    @archive_fullname = "#{@archive.fullname}" # "#{archive_info_legend(@archive)}"
    @archive_url_uuid = Rails.application.routes.url_helpers.url_for(only_path: false, controller: 'archives', action: 'show_uuid', uuid: @archive.archive_uuid, locale: locale)

    attachments.inline['logo_mailer'] = File.read("app/assets/images/logo_mailer.png")
    attachments.inline['logo_uke'] = File.read("app/assets/images/logo_uke_pl_do_lewej_small.png")

    mail(to: @recipient.email, subject: "#{t('title')} - #{@archive_fullname}" )
  end

end

# preview
# http://localhost:3000/rails/mailers/status_mailer/project_status_email.html