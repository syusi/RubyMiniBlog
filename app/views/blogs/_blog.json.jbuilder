json.extract! blog, :id, :body, :like, :created_at, :updated_at
json.url blog_url(blog, format: :json)
