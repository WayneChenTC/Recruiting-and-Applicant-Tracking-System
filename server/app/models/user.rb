class User < ApplicationRecord
  has_attached_file :document    
  has_many :applications, :dependent => :destroy
  has_many :jobs, :dependent => :destroy
  before_save { self.email = email.downcase }
  validates :role,  presence: true, length: { maximum: 50 }
  validates :password,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            uniqueness: true
  validates :name, presence:true

  validates_attachment_content_type :document, :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)
  has_secure_password
end
