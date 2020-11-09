# frozen_string_literal: true

class Swagger::Activity
  include Swagger::Blocks

  swagger_schema :Activity do
    property :id do
      key :type, :integer
      key :format, :int32
      key :example, 1
    end
    property :name do
      key :type, :string
      key :example, 'Dance class'
    end
    property :kind do
      key :type, :string
      key :example, 'indoor'
    end
  end
end
