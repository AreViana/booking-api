# frozen_string_literal: true

class Activities::Creator < BaseService
  def initialize(name:, kind:)
    @name = name
    @kind = kind
  end

  def call
    Activity.create!(name: name, kind: kind)
  end

  private

  attr_reader :name, :kind
end
