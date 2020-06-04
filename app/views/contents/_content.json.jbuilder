json.extract! content, :id, :title, :description, :slave, :link, :url, :sort, :show, :created_at, :updated_at
json.url content_url(content, format: :json)
