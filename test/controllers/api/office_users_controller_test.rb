require "test_helper"

class Api::OfficeUsersControllerTest < ActionDispatch::IntegrationTest
  test "should store office user" do
    user = User.first
    token = JsonWebToken.encode(user_id: user.id)

    password = Faker::Internet.password(min_length: 8)

    userToInclude = FactoryBot.create(:user)
    office = FactoryBot.create(:office)

    post api_office_users_path(office.id, userToInclude.id), headers: { "Authorization" => "Bearer #{token}" }

    assert_response :created
    json_response = JSON.parse(response.body)
    assert_equal office[:id], json_response['id']
    assert_equal userToInclude[:id], json_response['users'][0]['id']
  end

  test "should delete office user" do
    user = User.first
    token = JsonWebToken.encode(user_id: user.id)

    userToDelete = FactoryBot.create(:user)
    office = FactoryBot.create(:office)

    Office.find(office.id).users << userToDelete

    # abort api_office_users_path(office.id, userToDelete.id)
    delete "/api/offices/#{office.id}/user/#{userToDelete.id}", headers: { "Authorization" => "Bearer #{token}" }

    assert_response :ok
    assert_equal '{"message":"User removed from office with success!"}', response.body
  end
end

