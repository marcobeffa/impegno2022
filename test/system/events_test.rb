require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "should create event" do
    visit events_url
    click_on "New event"

    fill_in "Calendar", with: @event.calendar_id
    fill_in "Category", with: @event.category_id
    fill_in "Data conferma", with: @event.data_conferma
    fill_in "Description", with: @event.description
    fill_in "Durata minuti", with: @event.durata_minuti
    fill_in "Image card url", with: @event.image_card_url
    fill_in "Image icona url", with: @event.image_icona_url
    fill_in "Indirizzo", with: @event.indirizzo
    fill_in "Luogo", with: @event.luogo
    fill_in "N conduttori", with: @event.n_conduttori
    fill_in "N partecipanti", with: @event.n_partecipanti
    fill_in "Name", with: @event.name
    fill_in "Paese", with: @event.paese
    fill_in "Prezzo bambini", with: @event.prezzo_bambini
    fill_in "Prezzo pieno", with: @event.prezzo_pieno
    fill_in "Profile", with: @event.profile_id
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "should update Event" do
    visit event_url(@event)
    click_on "Edit this event", match: :first

    fill_in "Calendar", with: @event.calendar_id
    fill_in "Category", with: @event.category_id
    fill_in "Data conferma", with: @event.data_conferma
    fill_in "Description", with: @event.description
    fill_in "Durata minuti", with: @event.durata_minuti
    fill_in "Image card url", with: @event.image_card_url
    fill_in "Image icona url", with: @event.image_icona_url
    fill_in "Indirizzo", with: @event.indirizzo
    fill_in "Luogo", with: @event.luogo
    fill_in "N conduttori", with: @event.n_conduttori
    fill_in "N partecipanti", with: @event.n_partecipanti
    fill_in "Name", with: @event.name
    fill_in "Paese", with: @event.paese
    fill_in "Prezzo bambini", with: @event.prezzo_bambini
    fill_in "Prezzo pieno", with: @event.prezzo_pieno
    fill_in "Profile", with: @event.profile_id
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "should destroy Event" do
    visit event_url(@event)
    click_on "Destroy this event", match: :first

    assert_text "Event was successfully destroyed"
  end
end
