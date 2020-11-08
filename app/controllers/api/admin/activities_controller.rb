class Api::Admin::ActivitiesController < ApplicationController
  def index
    render json: Activities::Finder.call
  end

  def create
    render json: Activities::Creator.call(create_params)
  end

  def schedule
    render json: Activities::Scheduler.call(params[:id], schedule_params)
  end

  private

  def create_params
    params_data.permit(:name, :kind).to_h.deep_symbolize_keys
  end

  def schedule_params
    params_data.permit(:place, :date).merge(owner_id: current_user.id).to_h.deep_symbolize_keys
  end

  def authorize_request!
    authorize [:Admin, Activity]
  end
end
