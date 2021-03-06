class User < ApplicationRecord
  has_many :coaches, dependent: :destroy
  has_many :player, dependent: :destroy
  before_save { self.email = email.downcase }
  # validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
  # validates :role, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  attr_reader :password

  def self.find_from_credentials(email, password)
    user = find_by(email: email)
    return nil unless user
    user if user.is_password?(password)
  end

  def is_password?(password_attempt)
    BCrypt::Password.new(password_digest).is_password?(password_attempt)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
end
