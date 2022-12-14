require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url, params: { event: { calendar_id: @event.calendar_id, category_id: @event.category_id, data_conferma: @event.data_conferma, description: @event.description, durata_minuti: @event.durata_minuti, image_card_url: @event.image_card_url, image_icona_url: @event.image_icona_url, indirizzo: @event.indirizzo, luogo: @event.luogo, n_conduttori: @event.n_conduttori, n_partecipanti: @event.n_partecipanti, name: @event.name, paese: @event.paese, prezzo_bambini: @event.prezzo_bambini, prezzo_pieno: @event.prezzo_pieno, profile_id: @event.profile_id } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { calendar_id: @event.calendar_id, category_id: @event.category_id, data_conferma: @event.data_conferma, description: @event.description, durata_minuti: @event.durata_minuti, image_card_url: @event.image_card_url, image_icona_url: @event.image_icona_url, indirizzo: @event.indirizzo, luogo: @event.luogo, n_conduttori: @event.n_conduttori, n_partecipanti: @event.n_partecipanti, name: @event.name, paese: @event.paese, prezzo_bambini: @event.prezzo_bambini, prezzo_pieno: @event.prezzo_pieno, profile_id: @event.profile_id } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference("Event.count", -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
