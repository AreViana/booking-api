class Swagger::ActivitiesController
  include Swagger::Blocks

  # Admin Module
  swagger_path '/admin/activities' do
    operation :get do
      key :summary, 'Index activities'
      key :description, 'Display all the activities'
      key :operationId, 'AdminActivityIndex'
      key :tags, [
        'Admin'
      ]
      response 200 do
        key :description, 'activities response'
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :Activity
            end
          end
        end
      end
      response :default do
        key :description, 'api error'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end

  swagger_path '/admin/activities/' do
    operation :post do
      key :summary, 'Create activities'
      key :description, 'Admin can create activities'
      key :operationId, 'ActivityCreate'
      key :tags, [
        'Admin'
      ]
      parameter do
        key :name, :data
        key :in, :body
        key :type, :string
        key :description, 'Request body'
        key :required, true
        schema do
          key :type, :object
          property :data do
            key :type, :string
          end
          property :kind do
            key :type, :string
            key :enum, %w[online indoor outdoor]
          end
        end
      end
      response 200 do
        key :description, 'activity response'
        schema do
          property :data do
            key :'$ref', :Activity
          end
        end
      end
      response :default do
        key :description, 'api error'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end

  swagger_path '/admin/activities/{id}/schedule' do
    operation :post do
      key :summary, 'Schedule activities'
      key :description, 'Admin can schedule activities'
      key :operationId, 'ActivitySchedule'
      key :tags, [
        'Admin'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :type, :integer
        key :description, 'Actitvity ID'
        key :required, true
      end
      parameter do
        key :name, :data
        key :in, :body
        key :type, :string
        key :description, 'Request body'
        key :required, true
        schema do
          key :type, :object
          property :data do
            key :type, :object
            property :place do
              key :type, :string
            end
            property :date do
              key :type, :string
              key :example, 'Sat, 30 Nov 2020 13:30'
            end
          end
        end
      end
      response 200 do
        key :description, 'schedule response'
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :Schedule
            end
          end
        end
      end
      response :default do
        key :description, 'api error'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end

  # User Module
  swagger_path '/user/activities' do
    operation :get do
      key :summary, 'Index activities'
      key :description, 'Display all the activities'
      key :operationId, 'UserActivityIndex'
      key :tags, [
        'User'
      ]
      response 200 do
        key :description, 'activities response'
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :Activity
            end
          end
        end
      end
      response :default do
        key :description, 'api error'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end

  swagger_path '/user/activities/{id}/book' do
    operation :post do
      key :summary, 'Book activities'
      key :description, 'User can book activities'
      key :operationId, 'ActivityBook'
      key :tags, [
        'User'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :type, :integer
        key :description, 'Actitvity ID'
        key :required, true
      end
      parameter do
        key :name, :data
        key :in, :body
        key :type, :string
        key :description, 'Request body'
        key :required, true
        schema do
          key :type, :object
          property :data do
            key :type, :object
            property :schedule_id do
              key :type, :integer
            end
          end
        end
      end
      response 200 do
        key :description, 'booking response'
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :Booking
            end
          end
        end
      end
      response :default do
        key :description, 'api error'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end
end
