class Application < ApplicationRecord
  validates_presence_of :applicant_id, :user_id
  belongs_to :company, :optional => true #, :user
end
