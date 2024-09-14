require "test_helper"

class Api::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should throw unathenticated" do
    get api_users_path

    assert_response :unauthorized
  end

  test "should get index" do
    user = User.first
    token = JsonWebToken.encode(user_id: user.id)

    get api_users_path, headers: { "Authorization" => "Bearer #{token}" }

    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal user.id, json_response[0]['id']
  end

  test "should get show" do
    user = User.first
    token = JsonWebToken.encode(user_id: user.id)

    get api_user_path(user.id), headers: { "Authorization" => "Bearer #{token}" }

    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal user.id, json_response['id']
  end

  test "should store user" do
    user = User.first
    token = JsonWebToken.encode(user_id: user.id)

    password = Faker::Internet.password(min_length: 8)

    user_params = {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      active: true,
      password: password,
      password_confirmation: password
    }

    post api_users_path, params: user_params, headers: { "Authorization" => "Bearer #{token}" }

    assert_response :created
    json_response = JSON.parse(response.body)
    assert_equal user_params[:email], json_response['email']
  end

  test "should update user" do
    user = User.first
    token = JsonWebToken.encode(user_id: user.id)

    password = Faker::Internet.password(min_length: 8)

    userToUpdate = FactoryBot.create(:user)

    user_params = {
      name: "New name"
    }

    put api_user_path(userToUpdate.id), params: user_params, headers: { "Authorization" => "Bearer #{token}" }

    assert_response :ok
    json_response = JSON.parse(response.body)
    assert_equal userToUpdate.id, json_response['id']
    assert_not_equal userToUpdate.name, json_response['name']
    assert_equal user_params[:name], json_response['name']
  end

  test "should delete user" do
    user = User.first
    token = JsonWebToken.encode(user_id: user.id)

    password = Faker::Internet.password(min_length: 8)

    userToDelete = FactoryBot.create(:user)

    delete api_user_path(userToDelete.id), headers: { "Authorization" => "Bearer #{token}" }
    assert_response :ok

    userDeleted = User.find_by(id: userToDelete.id)

    assert_equal '{"message":"User deleted with success!"}', response.body
    assert_nil userDeleted
  end
end
