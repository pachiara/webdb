class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 6..25

  validate  :email_domain

  def email_domain
    if !WEBDEV['users_email_domain_validation_regex'].nil?
      r = Regexp.new(WEBDEV['users_email_domain_validation_regex'])
      if (r =~ email).nil?
        errors.add(:email, :invalid_domain)
      end
    end
  end

end
