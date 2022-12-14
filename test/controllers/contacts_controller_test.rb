require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference("Contact.count") do
      post contacts_url, params: { contact: { address_complete: @contact.address_complete, cap: @contact.cap, codice_fiscale: @contact.codice_fiscale, cognome: @contact.cognome, contatto_p_id: @contact.contatto_p_id, email: @contact.email, indirizzo: @contact.indirizzo, latitude: @contact.latitude, longitude: @contact.longitude, nome: @contact.nome, paese_città: @contact.paese_città, profile_id: @contact.profile_id, provincia: @contact.provincia, referencte_c_id: @contact.referencte_c_id, telefono: @contact.telefono, user_id: @contact.user_id, via: @contact.via } }
    end

    assert_redirected_to contact_url(Contact.last)
  end

  test "should show contact" do
    get contact_url(@contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { address_complete: @contact.address_complete, cap: @contact.cap, codice_fiscale: @contact.codice_fiscale, cognome: @contact.cognome, contatto_p_id: @contact.contatto_p_id, email: @contact.email, indirizzo: @contact.indirizzo, latitude: @contact.latitude, longitude: @contact.longitude, nome: @contact.nome, paese_città: @contact.paese_città, profile_id: @contact.profile_id, provincia: @contact.provincia, referencte_c_id: @contact.referencte_c_id, telefono: @contact.telefono, user_id: @contact.user_id, via: @contact.via } }
    assert_redirected_to contact_url(@contact)
  end

  test "should destroy contact" do
    assert_difference("Contact.count", -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end
