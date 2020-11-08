# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview
  def booking_mailer
    booking = Booking.last
    user = booking.user
    schedule = booking.schedule
    activity = schedule.activity

    BookingMailer.booked_activity(user, activity, schedule, booking.ticket)
  end
end
