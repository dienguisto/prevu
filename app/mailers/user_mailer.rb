class UserMailer < ApplicationMailer
  def welcome(email, password)
    @recipient = email
    @password = password
    @url = "www.prevu.com/log_in"
    mail(to: email,
         subject: "[Signed up] Welcome #{email}")
  end
end
