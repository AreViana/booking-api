# frozen_string_literal: true

class Activities::Creator < BaseService
  def initialize(params)
    @params = params
  end

  def call
    Activity.create(params)
  end

  private

  attr_reader :params
end
