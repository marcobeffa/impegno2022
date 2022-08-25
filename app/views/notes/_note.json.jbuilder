json.extract! note, :id, :profile_id, :name, :description, :body, :note_type, :euro_pagati, :euro_ricevuti, :data_start, :data_end, :lat, :long, :google_maps_url, :stato_attention, :visibility, :pubblica, :created_at, :updated_at
json.url note_url(note, format: :json)
