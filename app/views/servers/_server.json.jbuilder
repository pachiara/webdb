json.extract! server, :id, :ip, :name, :use, :description, :note, :domain, :manage, :created_at, :updated_at
json.url server_url(server, format: :json)
