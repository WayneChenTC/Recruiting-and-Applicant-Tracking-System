class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :password
      t.string :email
      t.string :role

      t.timestamps
    end
  end
end
