json.extract! service_review, :id, :title, :description, :slave, :link, :url, :sort, :show, :created_at, :updated_at
json.url service_review_url(service_review, format: :json)
