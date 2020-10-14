json.extract! pokemon, :id, :name, :weight, :height, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
