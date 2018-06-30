json.extract! short_url, :id, :original_url, :created_at, :updated_at
json.url short_url_url(short_url, format: :json)
