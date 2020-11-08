# frozen_string_literal: true

class Activities::Creator < BaseService
  def initialize(name:, kind:)
    @name = name
    @kind = kind
  end

  def call
    activity = Activity.create!(name: name, kind: kind)
    ActivityRepresenter.new(activity)
  end

  private

  attr_reader :name, :kind
end
