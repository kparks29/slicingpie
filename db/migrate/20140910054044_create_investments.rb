class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.float :capital
      t.float :expenses
      t.float :total
      t.float :tv
      t.references :grunt, index: true

      t.timestamps
    end
  end
end
