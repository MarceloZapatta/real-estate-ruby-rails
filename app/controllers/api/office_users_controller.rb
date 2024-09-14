class Api::OfficeUsersController < ApplicationController
  def store
    office = Office.find(params['id'])
    user = User.find(params['userId'])
    
    officeUser = OfficeUser.create(office: office, user: user)

    if officeUser.valid?
      render json: office.as_json(include: [:users]), status: 201
    else
      render json: officeUser.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    officeUser = OfficeUser.find_by!(office: params['id'], user: params['userId'])

    if officeUser.destroy
      render json: { message: "User removed from office with success!" }, status: 200
    else
      render json: { errors: "Unable to delete office" }, status: :unprocessable_entity
    end
  end
end
