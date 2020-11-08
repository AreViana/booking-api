require 'test_helper'

class BookingMailerTest < ActionMailer::TestCase
  def set_up
    @admin = users(:one)
    @user = users(:two)
    @activity = activities(:one)
    @schedule = @activity.schedules.create(
      place: 'My Home',
      date: DateTime.tomorrow,
      owner_id: @admin.id
    )
    @booking = @schedule.bookings.create(
      user: @user,
      ticket: SecureRandom.hex(10)
    )
  end

  test 'should send a booking email' do
    set_up
    email = BookingMailer.booked_activity(@user, @activity, @schedule, @booking.ticket).deliver_now
    assert_equal email.to, [@user.email]
    assert_equal email.subject, 'You are booked an activity'
  end
end
