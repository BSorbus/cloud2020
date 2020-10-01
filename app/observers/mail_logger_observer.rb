class MailLoggerObserver
  def self.delivered_email(mail)
    if mail.mailer_klass == "ArchiveMailer" && mail.mailer_action == "link_archive_show"
    	# puts '-------------------- MailLoggerObserver ------------------'
     #  puts "sender: #{mail.from}"
     #  puts "recipient: #{mail.to}"
     #  puts "bcc: #{mail.bcc}"
     #  puts "cc: #{mail.cc}"
     #  puts "subject: #{mail.subject}"
     #  puts "sent_at: #{mail.date}"
     #  #puts "body: #{body}"
     #  puts "mailer_klass: #{mail.mailer_klass}"
     #  puts "mailer_action: #{mail.mailer_action}"
     #  puts "mailer_archive: #{mail.mailer_archive}"
     #  puts "mailer_sending_user: #{mail.mailer_sending_user}"
      mail.mailer_archive.log_work_send_email('send_email_with_link', mail.mailer_sending_user.id, mail.to )
      # puts '----------------------------------------------------------'
    end
  end
end