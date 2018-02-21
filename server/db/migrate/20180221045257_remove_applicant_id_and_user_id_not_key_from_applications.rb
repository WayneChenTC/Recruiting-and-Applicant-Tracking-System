class RemoveApplicantIdAndUserIdNotKeyFromApplications < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :applicant_id, :integer
    remove_column :applications, :user_id_not_key, :string
  end
end
