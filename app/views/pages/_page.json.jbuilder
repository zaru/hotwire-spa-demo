json.extract! page, :id, :title, :description, :color, :created_at, :updated_at
json.url page_url(page, format: :json)
