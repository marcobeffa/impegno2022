require "test_helper"

class NoteslotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @noteslot = noteslots(:one)
  end

  test "should get index" do
    get noteslots_url
    assert_response :success
  end

  test "should get new" do
    get new_noteslot_url
    assert_response :success
  end

  test "should create noteslot" do
    assert_difference("Noteslot.count") do
      post noteslots_url, params: { noteslot: { note_id: @noteslot.note_id, profile_id: @noteslot.profile_id, slot_id: @noteslot.slot_id } }
    end

    assert_redirected_to noteslot_url(Noteslot.last)
  end

  test "should show noteslot" do
    get noteslot_url(@noteslot)
    assert_response :success
  end

  test "should get edit" do
    get edit_noteslot_url(@noteslot)
    assert_response :success
  end

  test "should update noteslot" do
    patch noteslot_url(@noteslot), params: { noteslot: { note_id: @noteslot.note_id, profile_id: @noteslot.profile_id, slot_id: @noteslot.slot_id } }
    assert_redirected_to noteslot_url(@noteslot)
  end

  test "should destroy noteslot" do
    assert_difference("Noteslot.count", -1) do
      delete noteslot_url(@noteslot)
    end

    assert_redirected_to noteslots_url
  end
end
