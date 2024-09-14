require "test_helper"

class Api::OfficesControllerTest < ActionDispatch::IntegrationTest
  test "should throw unathenticated" do
    get api_offices_path
    assert_response :unauthorized
  end

  test "should get index" do
    user = User.first
    token = JsonWebToken.encode(user_id: user.id)

    get api_offices_path, headers: { "Authorization" => "Bearer #{token}" }

    office = Office.first

    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal office.id, json_response[0]['id']
  end

  test "should get show" do
    user = User.first
    token = JsonWebToken.encode(user_id: user.id)

    office = Office.first

    get api_office_path(office.id), headers: { "Authorization" => "Bearer #{token}" }

    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal office.id, json_response['id']
  end

  test "should store office" do
    user = User.first
    token = JsonWebToken.encode(user_id: user.id)

    password = Faker::Internet.password(min_length: 8)

    office_params = {
      name: Faker::Name.name,
      active: true
    }

    post api_offices_path, params: office_params, headers: { "Authorization" => "Bearer #{token}" }

    assert_response :created
    json_response = JSON.parse(response.body)
    assert_equal office_params[:name], json_response['name']
  end

  test "should update office" do
    user = User.first
    token = JsonWebToken.encode(user_id: user.id)

    officeToUpdate = FactoryBot.create(:office)

    office_params = {
      name: "New name"
    }

    put api_office_path(officeToUpdate.id), params: office_params, headers: { "Authorization" => "Bearer #{token}" }

    assert_response :ok
    json_response = JSON.parse(response.body)
    assert_equal officeToUpdate.id, json_response['id']
    assert_not_equal officeToUpdate.name, json_response['name']
    assert_equal office_params[:name], json_response['name']
  end

  test "should delete office" do
    user = User.first
    token = JsonWebToken.encode(user_id: user.id)

    password = Faker::Internet.password(min_length: 8)

    officeToDelete = FactoryBot.create(:office)

    delete api_office_path(officeToDelete.id), headers: { "Authorization" => "Bearer #{token}" }
    assert_response :ok

    officeDeleted = Office.find_by(id: officeToDelete.id)

    assert_equal '{"message":"Office deleted with success!"}', response.body
    assert_nil officeDeleted
  end
end
