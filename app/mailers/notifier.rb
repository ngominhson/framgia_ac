class Notifier < ActionMailer::Base
  default from: "athuan255@gmail.com"

  def sent_mail(user)
    @user = user
    attachments["out#{user.id}.xls"] = File.read("app/assets/excels/out#{user.id}.xls")
    mail(to: user.email, subject: t(:welcome, scope: [:mailer, :subject]))
  end
  
end
