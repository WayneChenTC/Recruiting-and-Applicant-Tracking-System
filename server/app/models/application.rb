class Application < ApplicationRecord
  validates_presence_of :app_id, :user_id
end
