class Application < ApplicationRecord
  #validates_presence_of 
  belongs_to :job, :optional => false
  belongs_to :user, :optional =>false
end
