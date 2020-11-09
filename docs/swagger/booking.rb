# frozen_string_literal: true

class Swagger::Booking
  include Swagger::Blocks

  swagger_schema :Booking do
    property :id do
      key :type, :integer
      key :format, :int32
      key :example, 3
    end
    property :ticket do
      key :type, :string
      key :example, '6144a2e88c720df9d2e5'
    end
    property :schedule do
      key :type, :object
      items do
        key :'$ref', :Schedule
      end
    end
  end
end
