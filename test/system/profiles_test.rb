require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  setup do
    @profile = profiles(:one)
  end

  test "visiting the index" do
    visit profiles_url
    assert_selector "h1", text: "Profiles"
  end

  test "should create profile" do
    visit profiles_url
    click_on "New profile"

    fill_in "Active profile", with: @profile.active_profile_id
    fill_in "Avatar url", with: @profile.avatar_url
    fill_in "Description", with: @profile.description
    fill_in "Email", with: @profile.email
    fill_in "Name", with: @profile.name
    fill_in "Phone", with: @profile.phone
    fill_in "Prezzo orario", with: @profile.prezzo_orario
    fill_in "Referente profile", with: @profile.referente_profile_id
    fill_in "Smartphone", with: @profile.smartphone
    fill_in "Surname", with: @profile.surname
    fill_in "Team", with: @profile.team_id
    fill_in "Title", with: @profile.title
    fill_in "User", with: @profile.user_id
    fill_in "Username", with: @profile.username
    click_on "Create Profile"

    assert_text "Profile was successfully created"
    click_on "Back"
  end

  test "should update Profile" do
    visit profile_url(@profile)
    click_on "Edit this profile", match: :first

    fill_in "Active profile", with: @profile.active_profile_id
    fill_in "Avatar url", with: @profile.avatar_url
    fill_in "Description", with: @profile.description
    fill_in "Email", with: @profile.email
    fill_in "Name", with: @profile.name
    fill_in "Phone", with: @profile.phone
    fill_in "Prezzo orario", with: @profile.prezzo_orario
    fill_in "Referente profile", with: @profile.referente_profile_id
    fill_in "Smartphone", with: @profile.smartphone
    fill_in "Surname", with: @profile.surname
    fill_in "Team", with: @profile.team_id
    fill_in "Title", with: @profile.title
    fill_in "User", with: @profile.user_id
    fill_in "Username", with: @profile.username
    click_on "Update Profile"

    assert_text "Profile was successfully updated"
    click_on "Back"
  end

  test "should destroy Profile" do
    visit profile_url(@profile)
    click_on "Destroy this profile", match: :first

    assert_text "Profile was successfully destroyed"
  end
end
