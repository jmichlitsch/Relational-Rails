class CreateVehicle < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.integer :passenger_limit
      t.string :auto_transmission
      t.string :boolean
      t.string :created_at
      t.string :updated_at
    end
  end
end
