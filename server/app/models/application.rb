class Application < ApplicationRecord
  #validates_presence_of 
  belongs_to :job, :optional => true
  belongs_to :user, :optional => true
end
