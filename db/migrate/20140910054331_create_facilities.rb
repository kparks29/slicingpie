class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.float :rent
      t.float :tv
      t.references :grunt, index: true

      t.timestamps
    end
  end
end
