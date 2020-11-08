# frozen_string_literal: true

class Activities::Scheduler < BaseService
  def initialize(id, params)
    @id = id
    @params = params
  end

  def call
    activity = Activity.find(id)
    activity.schedules.create!(params)
    activity
  end

  private

  attr_reader :params, :id
end
