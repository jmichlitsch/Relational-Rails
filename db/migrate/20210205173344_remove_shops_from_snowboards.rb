class RemoveShopsFromSnowboards < ActiveRecord::Migration[5.2]
  def change
    remove_reference :snowboards, :shops, foreign_key: true
  end
end
