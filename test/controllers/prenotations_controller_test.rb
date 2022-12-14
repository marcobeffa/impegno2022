require "test_helper"

class PrenotationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prenotation = prenotations(:one)
  end

  test "should get index" do
    get prenotations_url
    assert_response :success
  end

  test "should get new" do
    get new_prenotation_url
    assert_response :success
  end

  test "should create prenotation" do
    assert_difference("Prenotation.count") do
      post prenotations_url, params: { prenotation: { confermata: @prenotation.confermata, contact_id: @prenotation.contact_id, data_pagamento: @prenotation.data_pagamento, description: @prenotation.description, email: @prenotation.email, event_id: @prenotation.event_id, fattura_anno: @prenotation.fattura_anno, fattura_n: @prenotation.fattura_n, name: @prenotation.name, pagamento_tipo: @prenotation.pagamento_tipo, price_value: @prenotation.price_value, profile_id: @prenotation.profile_id, slot_id: @prenotation.slot_id, tipo_prenotazione: @prenotation.tipo_prenotazione, user_id: @prenotation.user_id } }
    end

    assert_redirected_to prenotation_url(Prenotation.last)
  end

  test "should show prenotation" do
    get prenotation_url(@prenotation)
    assert_response :success
  end

  test "should get edit" do
    get edit_prenotation_url(@prenotation)
    assert_response :success
  end

  test "should update prenotation" do
    patch prenotation_url(@prenotation), params: { prenotation: { confermata: @prenotation.confermata, contact_id: @prenotation.contact_id, data_pagamento: @prenotation.data_pagamento, description: @prenotation.description, email: @prenotation.email, event_id: @prenotation.event_id, fattura_anno: @prenotation.fattura_anno, fattura_n: @prenotation.fattura_n, name: @prenotation.name, pagamento_tipo: @prenotation.pagamento_tipo, price_value: @prenotation.price_value, profile_id: @prenotation.profile_id, slot_id: @prenotation.slot_id, tipo_prenotazione: @prenotation.tipo_prenotazione, user_id: @prenotation.user_id } }
    assert_redirected_to prenotation_url(@prenotation)
  end

  test "should destroy prenotation" do
    assert_difference("Prenotation.count", -1) do
      delete prenotation_url(@prenotation)
    end

    assert_redirected_to prenotations_url
  end
end
