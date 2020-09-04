json.extract! service_sale, :id, :title, :description, :slave, :link, :url, :sort, :show, :created_at, :updated_at
json.url service_sale_url(service_sale, format: :json)
