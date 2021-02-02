require 'time'

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
      in_county: params[dealership][:in_county],
      created_at: Time.now.to_s,
      update_at: Time.now.to_s
      })

      dealership.save

      redirect_to '/dealerships'
  end
end
