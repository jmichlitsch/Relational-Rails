class CreateShop < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :square_footage
      t.boolean :parking_lot
      t.string :created_at
      t.string :updated_at
    end
  end
end
