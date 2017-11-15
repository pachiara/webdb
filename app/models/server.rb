class Server < ApplicationRecord
  resourcify
  has_many :instances, dependent: :destroy
  validates_presence_of :ip, :name, :use, :domain
  validates :ip, uniqueness: true
  validate :ip_valid

  def ip_valid
    begin
      IPAddr.new(ip)
    rescue IPAddr::InvalidAddressError
      errors.add(:ip, "formato invalido: #{ip}")
    end
  end
end
