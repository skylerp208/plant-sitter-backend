class Api::V1::RequestsController < ApplicationController
  before_action :find_request, only: [:update]
  def index
    @requests = Request.all
    render json: @requests
  end

  def update
    @request.update(request_params)
    if @request.save
      render json: @request, status: :accepted
    else
      render json: { errors: @request.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def request_params
    params.permit(:first_name, :last_name, :requestname, :address, :bio, :email)
  end

  def find_request
    @request = Request.find(params[:id])
  end
end
