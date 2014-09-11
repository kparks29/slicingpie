class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.references :company_users, index:true
      t.float :tv

      t.timestamps
    end
  end
end
