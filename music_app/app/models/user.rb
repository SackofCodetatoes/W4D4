class User < ApplicationRecord
  validates :email, presence: { message: 'Email cannot be blank' }, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 8, allow_nil: true }
  validates :session_token, presence: true, uniqueness: true
  before_validation :ensure_session_token


  attr_reader :password

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by email: email
     #debugger
    if user
      return user if user.is_password?(password)
    end
    nil
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end



end
