class RenameCompanyIdToJobIdInApplications < ActiveRecord::Migration[5.1]
  def change
      rename_column :applications, :company_id, :job_id
  end
end
