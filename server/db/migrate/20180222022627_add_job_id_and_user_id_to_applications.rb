class AddJobIdAndUserIdToApplications < ActiveRecord::Migration[5.1]
  def change
      add_reference :applications, :job, index: true
      add_reference :applications, :user, index: true
      add_foreign_key :applications, :jobs
      add_foreign_key :applications, :users
      
  end
end
