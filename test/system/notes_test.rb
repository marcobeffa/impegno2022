require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase
  setup do
    @note = notes(:one)
  end

  test "visiting the index" do
    visit notes_url
    assert_selector "h1", text: "Notes"
  end

  test "should create note" do
    visit notes_url
    click_on "New note"

    fill_in "Body", with: @note.body
    fill_in "Data end", with: @note.data_end
    fill_in "Data start", with: @note.data_start
    fill_in "Description", with: @note.description
    fill_in "Euro pagati", with: @note.euro_pagati
    fill_in "Euro ricevuti", with: @note.euro_ricevuti
    fill_in "Google maps url", with: @note.google_maps_url
    fill_in "Lat", with: @note.lat
    fill_in "Long", with: @note.long
    fill_in "Name", with: @note.name
    fill_in "Note type", with: @note.note_type
    fill_in "Profile", with: @note.profile_id
    check "Pubblica" if @note.pubblica
    fill_in "Stato attention", with: @note.stato_attention
    fill_in "Visibility", with: @note.visibility
    click_on "Create Note"

    assert_text "Note was successfully created"
    click_on "Back"
  end

  test "should update Note" do
    visit note_url(@note)
    click_on "Edit this note", match: :first

    fill_in "Body", with: @note.body
    fill_in "Data end", with: @note.data_end
    fill_in "Data start", with: @note.data_start
    fill_in "Description", with: @note.description
    fill_in "Euro pagati", with: @note.euro_pagati
    fill_in "Euro ricevuti", with: @note.euro_ricevuti
    fill_in "Google maps url", with: @note.google_maps_url
    fill_in "Lat", with: @note.lat
    fill_in "Long", with: @note.long
    fill_in "Name", with: @note.name
    fill_in "Note type", with: @note.note_type
    fill_in "Profile", with: @note.profile_id
    check "Pubblica" if @note.pubblica
    fill_in "Stato attention", with: @note.stato_attention
    fill_in "Visibility", with: @note.visibility
    click_on "Update Note"

    assert_text "Note was successfully updated"
    click_on "Back"
  end

  test "should destroy Note" do
    visit note_url(@note)
    click_on "Destroy this note", match: :first

    assert_text "Note was successfully destroyed"
  end
end
