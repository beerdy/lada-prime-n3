json.extract! service_whatwedo, :id, :title, :description, :slave, :link, :url, :sort, :show, :created_at, :updated_at
json.url service_whatwedo_url(service_whatwedo, format: :json)
