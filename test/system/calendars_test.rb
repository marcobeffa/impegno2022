require "application_system_test_case"

class CalendarsTest < ApplicationSystemTestCase
  setup do
    @calendar = calendars(:one)
  end

  test "visiting the index" do
    visit calendars_url
    assert_selector "h1", text: "Calendars"
  end

  test "should create calendar" do
    visit calendars_url
    click_on "New calendar"

    fill_in "Attivita note", with: @calendar.attivita_note_id
    fill_in "Body", with: @calendar.body
    fill_in "Calendar type", with: @calendar.calendar_type
    fill_in "Description", with: @calendar.description
    fill_in "Gruppo note", with: @calendar.gruppo_note_id
    fill_in "Image logo url", with: @calendar.image_logo_url
    fill_in "Image square url", with: @calendar.image_square_url
    fill_in "Luogo note", with: @calendar.luogo_note_id
    fill_in "Name", with: @calendar.name
    fill_in "Profile", with: @calendar.profile_id
    check "Public" if @calendar.public
    fill_in "Visibility", with: @calendar.visibility
    click_on "Create Calendar"

    assert_text "Calendar was successfully created"
    click_on "Back"
  end

  test "should update Calendar" do
    visit calendar_url(@calendar)
    click_on "Edit this calendar", match: :first

    fill_in "Attivita note", with: @calendar.attivita_note_id
    fill_in "Body", with: @calendar.body
    fill_in "Calendar type", with: @calendar.calendar_type
    fill_in "Description", with: @calendar.description
    fill_in "Gruppo note", with: @calendar.gruppo_note_id
    fill_in "Image logo url", with: @calendar.image_logo_url
    fill_in "Image square url", with: @calendar.image_square_url
    fill_in "Luogo note", with: @calendar.luogo_note_id
    fill_in "Name", with: @calendar.name
    fill_in "Profile", with: @calendar.profile_id
    check "Public" if @calendar.public
    fill_in "Visibility", with: @calendar.visibility
    click_on "Update Calendar"

    assert_text "Calendar was successfully updated"
    click_on "Back"
  end

  test "should destroy Calendar" do
    visit calendar_url(@calendar)
    click_on "Destroy this calendar", match: :first

    assert_text "Calendar was successfully destroyed"
  end
end
