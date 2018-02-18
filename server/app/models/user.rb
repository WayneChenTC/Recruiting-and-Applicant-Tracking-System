class User < ApplicationRecord
    has_many :applications, :optional => true
  before_save { self.email = email.downcase }
  validates :role,  presence: true, length: { maximum: 50 }
  validates :password,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            uniqueness: true
  has_secure_password
end
