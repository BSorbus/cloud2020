class MailLoggerObserver
  def self.delivered_email(mail)
  	puts '-------------------- MailLoggerObserver ------------------'
    puts "sender: #{mail.from}"
    puts "recipient: #{mail.to}"
    puts "bcc: #{mail.bcc}"
    puts "cc: #{mail.cc}"
    puts "subject: #{mail.subject}"
    #puts "body: #{body}"
    #puts "mailer_klass: #{mail.mailer_klass}"
    #puts "mailer_action: #{mail.mailer_action}"
    puts "sent_at: #{mail.date}"
  	puts '----------------------------------------------------------'
  end
end