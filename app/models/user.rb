class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password
  before_save { self.email = email.downcase }
  
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    length: { maximum: 60 }, format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       length: { minimum: 6, maximum: 25 }
  enum role: [:user, :admin]
end
