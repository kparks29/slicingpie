class CreateCompanyUsers < ActiveRecord::Migration
  def change
    create_table :company_users do |t|
      t.references :user, index: true
      t.references :company, index: true

      t.timestamps
    end
  end
end
