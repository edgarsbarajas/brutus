class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
