class Instance < ApplicationRecord
  resourcify
  belongs_to :server, :foreign_key => "server_id"
  belongs_to :service
  belongs_to :service_type
  validates_presence_of :name, :port
end
