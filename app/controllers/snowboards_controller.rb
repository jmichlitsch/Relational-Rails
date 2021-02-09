class SnowboardsController < ApplicationController
  def index
    @snowboards = Snowboard.all.find_all{|snowboard| snowboard.wide_stance == true}
  end

  def new
  end

  def create
    snowboard = Snowboard.new({
      name: params[:snowboard][:name],
      length: params[:snowboard][:length],
      wide_stance: params[:snowboard][:wide_stance],
      created_at: Time.now.to_s,
      updated_at: Time.now.to_s,
      })

      snowboard.save

      redirect_to '/snowboards'
  end

  def show
    @snowboard = Snowboard.find(params[:id])
  end

  def edit
    @snowboard = Snowboard.find(params[:id])
  end

  def update
    unless params[:snowboard][:wide_stance]
      params[:snowboard][:wide_stance] = false
    end

    snowboard = Snowboard.find(params[:id])
    snowboard.update({
      name: params[:snowboard][:name],
      length: params[:snowboard][:length],
      wide_stance: params[:snowboard][:wide_stance],
      created_at: Time.now.to_s,
      updated_at: Time.now.to_s
      })
      snowboard.save

      redirect_to "/snowboards/#{snowboard.id}"
  end

  def destroy
    snowboard = Snowboard.find(params[:id])
    shop_id = snowboard.shop_id
    Snowboard.destroy(params[:id])
    redirect_to "/snowboards"
    redirect_to "/shops/#{shop_id}/boards"
  end

end
