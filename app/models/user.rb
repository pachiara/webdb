class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 8..25

  validate  :email_domain

  def email_domain
    if !WEBDB['users_email_domain_validation_regex'].nil?
      r = Regexp.new(WEBDB['users_email_domain_validation_regex'])
      if (r =~ email).nil?
        errors.add(:email, :invalid_domain)
      end
    end
  end
end
