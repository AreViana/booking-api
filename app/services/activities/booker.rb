# frozen_string_literal: true
require 'securerandom'

class Activities::Booker < BaseService
  def initialize(id, schedule_id:, user:)
    @id = id
    @schedule_id = schedule_id
    @user = user
  end

  def call
    activity = Activity.find(id)
    schedule = activity.schedules.find(schedule_id)
    schedule.bookings.create!(
      user: user,
      ticket: SecureRandom.hex(10)
    )

    # TODO: NOTIFY
    activity
  end

  private

  attr_reader :id, :user, :schedule_id
end
