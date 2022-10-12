json.extract! calendar, :id, :profile_id, :name, :description, :body, :image_square_url, :image_logo_url, :calendar_type, :luogo_note_id, :attivita_note_id, :gruppo_note_id, :public, :visibility, :created_at, :updated_at
json.url calendar_url(calendar, format: :json)
