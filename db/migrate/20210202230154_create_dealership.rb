class CreateDealership < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.integer :max_inventory
      t.boolean :in_county
      t.string :created_at
      t.string :updated_at
    end
  end
end
