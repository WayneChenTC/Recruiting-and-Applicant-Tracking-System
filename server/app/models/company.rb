class Company < ApplicationRecord
    has_many :applications, :dependent => :destroy

  has_many :jobs
end
