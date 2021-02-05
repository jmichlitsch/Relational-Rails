require 'time'

class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
  end

  def new
  end

  def create
    # binding.pry
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
  end

  def edit
    @dealership = Dealership.find(params[:id])
  end

  def update
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

  def auto
  end
end
