# frozen_string_literal: true

class Swagger::Schedule
  include Swagger::Blocks

  swagger_schema :Schedule do
    property :id do
      key :type, :integer
      key :format, :int32
      key :example, 2
    end
    property :place do
      key :type, :string
      key :example, 'World Gym'
    end
    property :date do
      key :type, :string
      key :example, '2020-12-12'
    end
    property :hour do
      key :type, :string
      key :example, '13:30'
    end
    property :activity do
      key :type, :object
      items do
        key :'$ref', :Activity
      end
    end
  end
end
