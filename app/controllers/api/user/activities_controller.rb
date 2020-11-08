class Api::User::ActivitiesController < ApplicationController
  def index
    render json: Activities::Finder.call
  end

  def book
    render json: Activities::Booker.call(params[:id], book_params)
  end

  private

  def book_params
    params_data.permit(:schedule_id).merge(user: current_user).to_h.deep_symbolize_keys
  end

  def authorize_request!
    authorize [:User, Activity]
  end
end
