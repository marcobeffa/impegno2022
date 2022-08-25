require "test_helper"

class NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note = notes(:one)
  end

  test "should get index" do
    get notes_url
    assert_response :success
  end

  test "should get new" do
    get new_note_url
    assert_response :success
  end

  test "should create note" do
    assert_difference("Note.count") do
      post notes_url, params: { note: { body: @note.body, data_end: @note.data_end, data_start: @note.data_start, description: @note.description, euro_pagati: @note.euro_pagati, euro_ricevuti: @note.euro_ricevuti, google_maps_url: @note.google_maps_url, lat: @note.lat, long: @note.long, name: @note.name, note_type: @note.note_type, profile_id: @note.profile_id, pubblica: @note.pubblica, stato_attention: @note.stato_attention, visibility: @note.visibility } }
    end

    assert_redirected_to note_url(Note.last)
  end

  test "should show note" do
    get note_url(@note)
    assert_response :success
  end

  test "should get edit" do
    get edit_note_url(@note)
    assert_response :success
  end

  test "should update note" do
    patch note_url(@note), params: { note: { body: @note.body, data_end: @note.data_end, data_start: @note.data_start, description: @note.description, euro_pagati: @note.euro_pagati, euro_ricevuti: @note.euro_ricevuti, google_maps_url: @note.google_maps_url, lat: @note.lat, long: @note.long, name: @note.name, note_type: @note.note_type, profile_id: @note.profile_id, pubblica: @note.pubblica, stato_attention: @note.stato_attention, visibility: @note.visibility } }
    assert_redirected_to note_url(@note)
  end

  test "should destroy note" do
    assert_difference("Note.count", -1) do
      delete note_url(@note)
    end

    assert_redirected_to notes_url
  end
end
