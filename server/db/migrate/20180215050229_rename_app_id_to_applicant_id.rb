class RenameAppIdToApplicantId < ActiveRecord::Migration[5.1]
  def change
      rename_column :applications, :app_id, :applicant_id
  end
end
