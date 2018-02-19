class Application < ApplicationRecord
  validates_presence_of :applicant_id, :user_id_not_key
  belongs_to :company, :optional => false
  belongs_to :user, :optional =>false
end
