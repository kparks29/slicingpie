class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.float :num_hours
      t.date :date
      t.time :start_time
      t.time :end_time
      t.float :time_tv
      t.float :legal_fees
      t.float :prototype_costs
      t.float :other_costs
      t.float :unpaid_royalties
      t.float :tv
      t.references :grunt, index: true

      t.timestamps
    end
  end
end
