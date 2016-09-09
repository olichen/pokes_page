json.extract! poke, :id, :name, :weight, :order, :created_at, :updated_at
json.url poke_url(poke, format: :json)