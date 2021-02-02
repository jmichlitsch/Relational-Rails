class DealershipsController < ApplicationController
  def index
    @dealerships = ["dealership 1", "dealership 2"]
  end

  def new
  end

  def create
    dealership = Dealership.new({
      name: params[:dealership][:name],
      max_inventory: params[:dealership][:max_inventory],
      in_county: params[dealership][:in_county]
      })

      dealership.save

      redirect_to 'dealership'
  end
end
