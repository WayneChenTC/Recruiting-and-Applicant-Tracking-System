class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.references :company
      t.string :job_description
      t.string :employment_type
      t.string :responsibilities
      t.string :requirements

      t.timestamps
    end
    add_foreign_key :jobs, :companies
  end
end
