# frozen_string_literal: true

class Activities::Finder < BaseService
  def initialize(id = nil)
    @id = id
  end

  def call
    return ActivityRepresenter.new(Activity.find(id)) if id

    ActivityRepresenter.for_collection.new(Activity.all)
  end

  private

  attr_reader :id
end
