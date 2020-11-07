class Api::Admin::ActivitiesController < ApplicationController
  def index
    render json: Activities::Finder.call
  end

  def create
    render json: Activities::Creator.call(create_params)
  end


  private

  def create_params
    params_data.permit(:name, :kind)
  end


  def authorize_request!
    authorize [:Admin, Activity]
  end
end
