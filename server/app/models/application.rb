class Application < ApplicationRecord
  validates_presence_of :applicant_id, :user_id
end
