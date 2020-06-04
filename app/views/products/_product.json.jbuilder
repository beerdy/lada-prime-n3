json.extract! product, :id, :title, :description, :slave, :link, :url, :sort, :show, :created_at, :updated_at
json.url product_url(product, format: :json)
