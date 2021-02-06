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

  def boards
    @snowboards = Snowboard.all
    @boards = @snowboards.map do |snowboard|
      snowboard.shop_id == params[:id].to_i
    end
    @shop_id = params[:id].to_i
  end

  def create_board
    shop = Shop.find(params[:shop_id])
    snowboard = shop.snowboards.new({
      name: params[:snowboard][:name],
      length: params[:snowboard][:length],
      wide_stance: params[:snowboard][:wide_stance],
      created_at: Time.now.to_s,
      updated_at: Time.now.to_s,
      })
     snowboard.save

      redirect_to "/shops/#{shop.id}/boards"
  end

  def new_board
    @shop = Shop.all.find{|shop| shop.id == params[:id].to_i}
    @shop
  end
end
