class AddDealershipsToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_reference :vehicles, :dealership, foreign_key: true
  end
end
