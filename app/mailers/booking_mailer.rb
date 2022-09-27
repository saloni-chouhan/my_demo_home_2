class BookingMailer < ApplicationMailer
	 default from: 'me@example.com'

  def welcome_email(email)
    @email = email
    mail(to: @email, subject: 'Flight Booking Confirmation Mail', from: "saal@gmail.com")
  end
end
