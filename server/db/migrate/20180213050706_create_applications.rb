class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.integer :app_id
      t.integer :user_id
      t.string :cur_company
      t.string :linkedin_url
      t.string :portfolio_url
      t.text :add_info
      t.string :gender
      t.string :race
      t.string :veteran_stat
      t.string :disability_stat
      t.timestamps
    end
  end
end
