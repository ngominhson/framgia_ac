class UserMailer < ActionMailer::Base
  default from: "nmson.khmt@gmail.com"
  def send_email(user)
    @user = user
    attachments["out#{user.id}.xls"] = File.read("app/assets/excels/out#{user.id}.xls")
    mail(to: @user.email, subject: 'Salary_Detail')
  end
end