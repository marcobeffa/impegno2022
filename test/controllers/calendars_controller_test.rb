require "test_helper"

class CalendarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calendar = calendars(:one)
  end

  test "should get index" do
    get calendars_url
    assert_response :success
  end

  test "should get new" do
    get new_calendar_url
    assert_response :success
  end

  test "should create calendar" do
    assert_difference("Calendar.count") do
      post calendars_url, params: { calendar: { attivita_note_id: @calendar.attivita_note_id, body: @calendar.body, calendar_type: @calendar.calendar_type, description: @calendar.description, gruppo_note_id: @calendar.gruppo_note_id, image_logo_url: @calendar.image_logo_url, image_square_url: @calendar.image_square_url, luogo_note_id: @calendar.luogo_note_id, name: @calendar.name, profile_id: @calendar.profile_id, public: @calendar.public, visibility: @calendar.visibility } }
    end

    assert_redirected_to calendar_url(Calendar.last)
  end

  test "should show calendar" do
    get calendar_url(@calendar)
    assert_response :success
  end

  test "should get edit" do
    get edit_calendar_url(@calendar)
    assert_response :success
  end

  test "should update calendar" do
    patch calendar_url(@calendar), params: { calendar: { attivita_note_id: @calendar.attivita_note_id, body: @calendar.body, calendar_type: @calendar.calendar_type, description: @calendar.description, gruppo_note_id: @calendar.gruppo_note_id, image_logo_url: @calendar.image_logo_url, image_square_url: @calendar.image_square_url, luogo_note_id: @calendar.luogo_note_id, name: @calendar.name, profile_id: @calendar.profile_id, public: @calendar.public, visibility: @calendar.visibility } }
    assert_redirected_to calendar_url(@calendar)
  end

  test "should destroy calendar" do
    assert_difference("Calendar.count", -1) do
      delete calendar_url(@calendar)
    end

    assert_redirected_to calendars_url
  end
end
