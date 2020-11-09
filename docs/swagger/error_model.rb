class Swagger::ErrorModel
  include Swagger::Blocks

  swagger_schema :ErrorModel do
    key :type, :object
    property :error do
      key :type, :object
      property :type do
        key :type, :string
      end
      property :message do
        key :type, :string
      end
      property :details do
        key :type, :object
      end
    end
  end
end
