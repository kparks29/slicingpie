class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.float :num_hours
      t.date :date
      t.time :start_time
      t.time :end_time
      t.float :tv
      t.references :grunt, index: true

      t.timestamps
    end
  end
end
