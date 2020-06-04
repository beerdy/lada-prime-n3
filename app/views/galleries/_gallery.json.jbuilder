json.extract! gallery, :id, :title, :description, :slave, :link, :url, :sort, :show, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)
