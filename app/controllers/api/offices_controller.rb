class Api::OfficesController < ApplicationController
  def index
    offices = Office.includes(:users).all
    render json: offices.as_json(include: [:users]), status: :ok
  end

  def create
    office = Office.new(office_params)
    if office.save
      render json: office, status: 201
    else
      render json: office.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    office = Office.find(params['id'])

    if office.update(office_params)
      render json: office, status: :ok
    else
      render json: office.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    office = Office.find(params['id'])
    render json: office, status: :ok
  end


  def destroy
    office = Office.find(params['id'])

    if office.destroy
      render json: { message: "Office deleted with success!" }, status: :ok
    else
      render json: { errors: "Unable to delete office" }, status: :unprocessable_entity
    end
  end

  private
    def office_params
      params.permit(:name, :active)
    end
end
