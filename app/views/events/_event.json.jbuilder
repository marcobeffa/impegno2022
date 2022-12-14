json.extract! event, :id, :profile_id, :name, :description, :image_icona_url, :image_card_url, :n_partecipanti, :n_conduttori, :durata_minuti, :indirizzo, :luogo, :paese, :prezzo_pieno, :prezzo_bambini, :calendar_id, :category_id, :data_conferma, :created_at, :updated_at
json.url event_url(event, format: :json)
