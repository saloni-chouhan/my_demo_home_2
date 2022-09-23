class BookingMailer < ApplicationMailer
	 default from: 'me@example.com'

  def welcome_email(email)
    @email = email
    mail(to: @email, subject: 'Welcome to My Awesome Site', from: "saal@gmail.com")
  end
end
