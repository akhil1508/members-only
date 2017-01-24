class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :encrypted_remember_token
  has_secure_password
  validates :password, presence: true, length: { minimum: 3}
  has_many :posts, :foreign_key => "id"
  def encrypted_remember_token
    encrypted = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
    @remember_token = encrypted
  end
end
