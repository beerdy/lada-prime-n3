json.extract! page, :id, :title, :description, :slave, :link, :url, :sort, :show, :created_at, :updated_at
json.url page_url(page, format: :json)
