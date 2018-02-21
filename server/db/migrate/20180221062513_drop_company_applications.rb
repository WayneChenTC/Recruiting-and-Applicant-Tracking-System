class DropCompanyApplications < ActiveRecord::Migration[5.1]
  def change
      drop_table :company_applications
  end
end
