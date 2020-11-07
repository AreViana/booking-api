# frozen_string_literal: true

class Activities::Finder < BaseService
  def initialize(id = null)
    @id = id
  end

  def call
    return Activity.find(id) if id

    Activity.all
  end

  private

  attr_reader :id
end
