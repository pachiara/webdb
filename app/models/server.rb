class Server < ApplicationRecord
  resourcify
  has_many :instances, dependent: :destroy
  validates_presence_of :ip, :name, :use_id, :domain_id
  validates :ip, uniqueness: true
  validate :ip_valid
  belongs_to :use
  belongs_to :domain
  belongs_to :type

  def ip_valid
    begin
      IPAddr.new(ip)
    rescue IPAddr::InvalidAddressError
      errors.add(:ip, "formato invalido: #{ip}")
    end
  end
end
