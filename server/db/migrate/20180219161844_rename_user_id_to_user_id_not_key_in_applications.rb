class RenameUserIdToUserIdNotKeyInApplications < ActiveRecord::Migration[5.1]
  def change
      rename_column :applications, :user_id, :user_id_not_key
  end
end
