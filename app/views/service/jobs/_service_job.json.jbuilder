json.extract! service_job, :id, :title, :description, :slave, :link, :url, :sort, :show, :created_at, :updated_at
json.url service_job_url(service_job, format: :json)
