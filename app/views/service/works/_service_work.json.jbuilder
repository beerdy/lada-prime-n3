json.extract! service_work, :id, :title, :description, :slave, :link, :url, :sort, :show, :created_at, :updated_at
json.url service_work_url(service_work, format: :json)
