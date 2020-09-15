json.extract! service_write, :id, :name, :phone, :model, :year, :work, :mileage, :link, :url, :sort, :show, :created_at, :updated_at
json.url service_write_url(service_write, format: :json)
