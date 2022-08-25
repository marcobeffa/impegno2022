json.extract! profile, :id, :user_id, :title, :description, :avatar_url, :name, :surname, :username, :email, :phone, :smartphone, :prezzo_orario, :active_profile_id, :team_id, :referente_profile_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
