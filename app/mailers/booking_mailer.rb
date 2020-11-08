class BookingMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def booked_activity(user, activity, schedule, ticket)
    @user = user
    @activity = activity
    @schedule = schedule
    @ticket = ticket
    mail(to: @user.email, subject: 'You are booked an activity')
  end
end
