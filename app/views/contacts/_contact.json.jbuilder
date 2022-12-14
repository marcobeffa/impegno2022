json.extract! contact, :id, :user_id, :referencte_c_id, :profile_id, :contatto_p_id, :nome, :cognome, :indirizzo, :codice_fiscale, :email, :telefono, :via, :cap, :paese_città, :provincia, :address_complete, :latitude, :longitude, :created_at, :updated_at
json.url contact_url(contact, format: :json)
