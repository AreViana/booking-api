# frozen_string_literal: true

class Api::DocsController < ApplicationController
  include Swagger::Blocks

  skip_before_action :authenticate
  skip_before_action :authorize_request!

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Booking API'
      key :description, <<~DOCS
        A sample Booking API that contains 3 modules: **Authentication, Admin, User**.
        **Authentication** module has 3 basic actions: SignUp, SignIn, SignOut.
        **Admin** module can list, create and schedule an activity
        **User** module can list and book the existingg activities
      DOCS
      key :termsOfService, ''
      contact do
        key :name, 'Arely Viana'
      end
      license do
        key :name, 'MIT'
      end
    end
    key :host, 'http://booking-api-arevn.herokuapp.com'
    key :basePath, '/api'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  SWAGGERED_CLASSES = [
    ::Swagger::ActivitiesController,
    ::Swagger::Activity,
    ::Swagger::Schedule,
    ::Swagger::Booking,
    ::Swagger::ErrorModel,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
