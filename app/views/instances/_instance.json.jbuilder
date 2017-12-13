json.extract! instance, :id, :server_id, :name, :port, :note, :check, :created_at, :updated_at
json.url server_instances_url(instance, format: :json)
