class CreateGrunts < ActiveRecord::Migration
  def change
    create_table :grunts do |t|
      t.date :start_date
      t.float :salary
      t.float :cash_compensation
      t.float :hourly_rate
      t.float :ghrr
      t.float :commission_rate
      t.references :company, index: true
      t.references :user, index:true
      t.string :title
      t.boolean :is_leader
      t.float :equity
      t.float :total_contributions

      t.timestamps
    end
  end
end
