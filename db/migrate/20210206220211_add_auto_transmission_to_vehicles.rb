class AddAutoTransmissionToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :auto_transmission, :boolean
  end
end
