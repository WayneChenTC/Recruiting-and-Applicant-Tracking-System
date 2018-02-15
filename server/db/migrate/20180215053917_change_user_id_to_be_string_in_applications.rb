class ChangeUserIdToBeStringInApplications < ActiveRecord::Migration[5.1]
  def change
      change_column :applications, :user_id, :string
  end
end
