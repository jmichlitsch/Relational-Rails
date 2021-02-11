class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.does_have_auto_transmission
    # @true = @vehicles.find_all{|vehicle| vehicle.auto_transmission == true}
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    unless params[:vehicle][:auto_transmission]
      params[:vehicle][:auto_transmission] = false
    end

    vehicle = Vehicle.find(params[:id])
    vehicle.update({
      name: params[:vehicle][:name],
      passenger_limit: params[:vehicle][:passenger_limit],
      auto_transmission: params[:vehicle][:auto_transmission],
      updated_at: Time.now.to_s
      })
      vehicle.save
      redirect_to "/vehicles/#{vehicle.id}"
  end

  def new
  end


  def destroy
    vehicle = Vehicle.find(params[:id])
    dealership_id = vehicle.dealership_id
    Vehicle.destroy(params[:id])
    redirect_to "/vehicles"
    # redirect_to "/dealerships/#{dealership_id}/autos"
  end
end
