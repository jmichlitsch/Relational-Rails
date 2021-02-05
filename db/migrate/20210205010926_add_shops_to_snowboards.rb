class AddShopsToSnowboards < ActiveRecord::Migration[5.2]
  def change
    add_reference :snowboards, :shop, foreign_key: true
  end
end
