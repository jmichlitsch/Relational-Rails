require 'time'

class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
    @order = @dealerships.sort_by{|dealership| dealership.id}.reverse
  end

  def new
  end

  def create
    unless params[:dealership][:in_county]
      params[:dealership][:in_county] = false
    end
    
    dealership = Dealership.new({
      name: params[:dealership][:name],
      max_inventory: params[:dealership][:max_inventory],
      in_county: params[:dealership][:in_county],
      created_at: Time.now.to_s,
      updated_at: Time.now.to_s
      })
      dealership.save

      redirect_to '/dealerships'
  end

  def show
    @dealership = Dealership.find(params[:id])
    @child_count = @dealership.vehicles.count 
  end

  def edit
    @dealership = Dealership.find(params[:id])
  end

  def update
    unless params[:dealership][:in_county]
      params[:dealership][:in_county] = false
    end

    dealership = Dealership.find(params[:id])
    dealership.update({
      name: params[:dealership][:name],
      max_inventory: params[:dealership][:max_inventory],
      in_county: params[:dealership][:in_county],
      updated_at: Time.now.to_s
      })
      dealership.save
      redirect_to "/dealerships/#{dealership.id}"
  end

  def destroy
    Dealership.destroy(params[:id])
    redirect_to '/dealerships'
  end

  def autos
    @vehicles = Vehicle.all
    @autos = @vehicles.find_all do |vehicle|
      vehicle.dealership_id == params[:id].to_i
    end
    @dealership_id = params[:id].to_i
  end

  def create_auto
    unless params[:vehicle][:auto_transmission]
      params[:vehicle][:auto_transmission] = false
    end

    dealership = Dealership.find(params[:dealership_id])
    vehicle = dealership.vehicles.new({
      name: params[:vehicle][:name],
      passenger_limit: params[:vehicle][:passenger_limit],
      auto_transmission: params[:vehicle][:auto_transmission],
      created_at: Time.now.to_s,
      updated_at: Time.now.to_s
      })

    vehicle.save

    redirect_to "/dealerships/#{dealership.id}/autos"
  end

  def new_auto
    @dealership = Dealership.all.find{|dealership| dealership.id == params[:id].to_i}
  end

  def limits
    binding.pry
    @autos = @autos.find_all{|auto| auto.passenger_limit > limits}

    redirect_to "/dealerships/#{dealership.id}/autos"
  end
end
