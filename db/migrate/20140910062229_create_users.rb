class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.references :company_users, index:true

      t.timestamps
    end
  end
end