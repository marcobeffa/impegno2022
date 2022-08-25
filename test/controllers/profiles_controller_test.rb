require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference("Profile.count") do
      post profiles_url, params: { profile: { active_profile_id: @profile.active_profile_id, avatar_url: @profile.avatar_url, description: @profile.description, email: @profile.email, name: @profile.name, phone: @profile.phone, prezzo_orario: @profile.prezzo_orario, referente_profile_id: @profile.referente_profile_id, smartphone: @profile.smartphone, surname: @profile.surname, team_id: @profile.team_id, title: @profile.title, user_id: @profile.user_id, username: @profile.username } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { active_profile_id: @profile.active_profile_id, avatar_url: @profile.avatar_url, description: @profile.description, email: @profile.email, name: @profile.name, phone: @profile.phone, prezzo_orario: @profile.prezzo_orario, referente_profile_id: @profile.referente_profile_id, smartphone: @profile.smartphone, surname: @profile.surname, team_id: @profile.team_id, title: @profile.title, user_id: @profile.user_id, username: @profile.username } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference("Profile.count", -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
