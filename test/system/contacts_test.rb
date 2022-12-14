require "application_system_test_case"

class ContactsTest < ApplicationSystemTestCase
  setup do
    @contact = contacts(:one)
  end

  test "visiting the index" do
    visit contacts_url
    assert_selector "h1", text: "Contacts"
  end

  test "should create contact" do
    visit contacts_url
    click_on "New contact"

    fill_in "Address complete", with: @contact.address_complete
    fill_in "Cap", with: @contact.cap
    fill_in "Codice fiscale", with: @contact.codice_fiscale
    fill_in "Cognome", with: @contact.cognome
    fill_in "Contatto p", with: @contact.contatto_p_id
    fill_in "Email", with: @contact.email
    fill_in "Indirizzo", with: @contact.indirizzo
    fill_in "Latitude", with: @contact.latitude
    fill_in "Longitude", with: @contact.longitude
    fill_in "Nome", with: @contact.nome
    fill_in "Paese città", with: @contact.paese_città
    fill_in "Profile", with: @contact.profile_id
    fill_in "Provincia", with: @contact.provincia
    fill_in "Referencte c", with: @contact.referencte_c_id
    fill_in "Telefono", with: @contact.telefono
    fill_in "User", with: @contact.user_id
    fill_in "Via", with: @contact.via
    click_on "Create Contact"

    assert_text "Contact was successfully created"
    click_on "Back"
  end

  test "should update Contact" do
    visit contact_url(@contact)
    click_on "Edit this contact", match: :first

    fill_in "Address complete", with: @contact.address_complete
    fill_in "Cap", with: @contact.cap
    fill_in "Codice fiscale", with: @contact.codice_fiscale
    fill_in "Cognome", with: @contact.cognome
    fill_in "Contatto p", with: @contact.contatto_p_id
    fill_in "Email", with: @contact.email
    fill_in "Indirizzo", with: @contact.indirizzo
    fill_in "Latitude", with: @contact.latitude
    fill_in "Longitude", with: @contact.longitude
    fill_in "Nome", with: @contact.nome
    fill_in "Paese città", with: @contact.paese_città
    fill_in "Profile", with: @contact.profile_id
    fill_in "Provincia", with: @contact.provincia
    fill_in "Referencte c", with: @contact.referencte_c_id
    fill_in "Telefono", with: @contact.telefono
    fill_in "User", with: @contact.user_id
    fill_in "Via", with: @contact.via
    click_on "Update Contact"

    assert_text "Contact was successfully updated"
    click_on "Back"
  end

  test "should destroy Contact" do
    visit contact_url(@contact)
    click_on "Destroy this contact", match: :first

    assert_text "Contact was successfully destroyed"
  end
end
