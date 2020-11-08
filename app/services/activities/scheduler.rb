# frozen_string_literal: true

class Activities::Scheduler < BaseService
  def initialize(id, place:, date:, owner_id:)
    @id = id
    @place = place
    @date = date
    @owner_id = owner_id
  end

  def call
    activity = Activity.find(id)
    activity.schedules.create!(
      place: place,
      date: date,
      owner_id: owner_id
    )
    activity
  end

  private

  attr_reader :place, :date, :owner_id, :id
end
