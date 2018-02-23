class Job < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :applications, :dependent => :destroy

end
