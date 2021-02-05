class SnowboardsController < ApplicationController
  def index
    @snowboards = Snowboard.all
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
    Snowboard.destroy(params[:id])
    redirect_to '/snowboards'
  end

end
