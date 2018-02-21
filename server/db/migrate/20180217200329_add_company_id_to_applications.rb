class AddCompanyIdToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :company_id, :integer
  end
end
