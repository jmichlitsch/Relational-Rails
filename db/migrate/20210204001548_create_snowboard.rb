class CreateSnowboard < ActiveRecord::Migration[5.2]
  def change
    create_table :snowboards do |t|
      t.string :name
      t.integer :length
      t.boolean :wide_stance
      t.string :created_at
      t.string :updated_at
    end
  end
end
