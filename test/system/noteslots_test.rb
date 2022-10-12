require "application_system_test_case"

class NoteslotsTest < ApplicationSystemTestCase
  setup do
    @noteslot = noteslots(:one)
  end

  test "visiting the index" do
    visit noteslots_url
    assert_selector "h1", text: "Noteslots"
  end

  test "should create noteslot" do
    visit noteslots_url
    click_on "New noteslot"

    fill_in "Note", with: @noteslot.note_id
    fill_in "Profile", with: @noteslot.profile_id
    fill_in "Slot", with: @noteslot.slot_id
    click_on "Create Noteslot"

    assert_text "Noteslot was successfully created"
    click_on "Back"
  end

  test "should update Noteslot" do
    visit noteslot_url(@noteslot)
    click_on "Edit this noteslot", match: :first

    fill_in "Note", with: @noteslot.note_id
    fill_in "Profile", with: @noteslot.profile_id
    fill_in "Slot", with: @noteslot.slot_id
    click_on "Update Noteslot"

    assert_text "Noteslot was successfully updated"
    click_on "Back"
  end

  test "should destroy Noteslot" do
    visit noteslot_url(@noteslot)
    click_on "Destroy this noteslot", match: :first

    assert_text "Noteslot was successfully destroyed"
  end
end
