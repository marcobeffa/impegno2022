require "application_system_test_case"

class PrenotationsTest < ApplicationSystemTestCase
  setup do
    @prenotation = prenotations(:one)
  end

  test "visiting the index" do
    visit prenotations_url
    assert_selector "h1", text: "Prenotations"
  end

  test "should create prenotation" do
    visit prenotations_url
    click_on "New prenotation"

    fill_in "Confermata", with: @prenotation.confermata
    fill_in "Contact", with: @prenotation.contact_id
    fill_in "Data pagamento", with: @prenotation.data_pagamento
    fill_in "Description", with: @prenotation.description
    fill_in "Email", with: @prenotation.email
    fill_in "Event", with: @prenotation.event_id
    fill_in "Fattura anno", with: @prenotation.fattura_anno
    fill_in "Fattura n", with: @prenotation.fattura_n
    fill_in "Name", with: @prenotation.name
    fill_in "Pagamento tipo", with: @prenotation.pagamento_tipo
    fill_in "Price value", with: @prenotation.price_value
    fill_in "Profile", with: @prenotation.profile_id
    fill_in "Slot", with: @prenotation.slot_id
    fill_in "Tipo prenotazione", with: @prenotation.tipo_prenotazione
    fill_in "User", with: @prenotation.user_id
    click_on "Create Prenotation"

    assert_text "Prenotation was successfully created"
    click_on "Back"
  end

  test "should update Prenotation" do
    visit prenotation_url(@prenotation)
    click_on "Edit this prenotation", match: :first

    fill_in "Confermata", with: @prenotation.confermata
    fill_in "Contact", with: @prenotation.contact_id
    fill_in "Data pagamento", with: @prenotation.data_pagamento
    fill_in "Description", with: @prenotation.description
    fill_in "Email", with: @prenotation.email
    fill_in "Event", with: @prenotation.event_id
    fill_in "Fattura anno", with: @prenotation.fattura_anno
    fill_in "Fattura n", with: @prenotation.fattura_n
    fill_in "Name", with: @prenotation.name
    fill_in "Pagamento tipo", with: @prenotation.pagamento_tipo
    fill_in "Price value", with: @prenotation.price_value
    fill_in "Profile", with: @prenotation.profile_id
    fill_in "Slot", with: @prenotation.slot_id
    fill_in "Tipo prenotazione", with: @prenotation.tipo_prenotazione
    fill_in "User", with: @prenotation.user_id
    click_on "Update Prenotation"

    assert_text "Prenotation was successfully updated"
    click_on "Back"
  end

  test "should destroy Prenotation" do
    visit prenotation_url(@prenotation)
    click_on "Destroy this prenotation", match: :first

    assert_text "Prenotation was successfully destroyed"
  end
end
