class RemoveAutoTransmissionFromVehicles < ActiveRecord::Migration[5.2]
  def change
    remove_column :vehicles, :auto_transmission, :string
    remove_column :vehicles, :boolean, :string
  end
end
