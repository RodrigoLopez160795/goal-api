class User < ApplicationRecord
  belongs_to :list
  has_secure_password
  has_secure_token
  validates :username, :email, presence: true
  validates :username, length: { in: 6..20 }, presence: true
  validates :email, :username, uniqueness: true
  validates :password_digest, length: { minimum: 6 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/, message: 'invalid email' }

  def invalidate_token
    update(token: nil)
  end

  def self.authenticate(email = nil, username = nil, password)
    user = User.find_by(email:) unless email.nil?
    user = User.find_by(username:) unless username.nil?
    return false unless user&.authenticate(password)

    user.regenerate_token
    user
  end
end
