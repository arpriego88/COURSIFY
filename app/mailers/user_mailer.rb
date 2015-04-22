class UserMailer < ActionMailer::Base
  layout 'user_mailer'
  default from: "Banner Sports <welcome@bannersports.com>"

  def user_welcome user
    @user = user
    mail to: user.email, subject: "Welcome to Banner!"
  end
  
end