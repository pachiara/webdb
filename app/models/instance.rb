class Instance < ApplicationRecord
  resourcify
  belongs_to :server
end
