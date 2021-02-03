class ShopsController < ApplicationController 
  def index
    @shops = Shop.all 
  end
  
  def new
  end

  def create 
    shop = Shop.new({
      name: params[:shop][:name],
      square_footage: params[:shop][:square_footage],
      parking_lot: params[:shop][:parking_lot],
      created_at: Time.now.to_s,
      updated_at: Time.now.to_s
      })
      shop.save

      redirect_to '/shops'
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    shop.update({
      name: params[:shop][:name],
      square_footage: params[:shop][:square_footage],
      parking_lot: params[:shop][:parking_lot],
      updated_at: Time.now.to_s
      })
      shop.save
      redirect_to "/shops/#{shop.id}"
  end

  def destroy
    Shop.destroy(params[:id])
    redirect_to '/shops'
  end
end