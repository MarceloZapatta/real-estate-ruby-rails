class Api::OfficesController < ApplicationController
  def index
    offices = Office.includes(:users).all
    render json: offices.as_json(include: [:users]), status: 200
  end

  def store
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
      render json: office, status: 200
    else
      render json: office.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    office = Office.find(params['id'])
    render json: office, status: 200
  end


  def destroy
    office = Office.find(params['id'])

    if office.destroy
      render json: { message: "Office deleted with success!" }, status: 200
    else
      render json: { errors: "Unable to delete office" }, status: :unprocessable_entity
    end
  end

  private
    def office_params
      params.permit(:name, :active)
    end
end
