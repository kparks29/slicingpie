class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.float :amount
      t.float :one_year_cost
      t.float :one_year_value
      t.float :tv
      t.references :grunt, index: true

      t.timestamps
    end
  end
end
