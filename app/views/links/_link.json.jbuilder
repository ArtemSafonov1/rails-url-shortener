json.extract! link, :id, :original_url, :short_url, :clicked, :created_at, :updated_at
json.url link_url(link, format: :json)
