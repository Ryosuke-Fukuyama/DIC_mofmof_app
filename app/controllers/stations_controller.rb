class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  def new
    if params[:back]
      @station = Picture.new(station_params)
    else
      @station = Picture.new
    end
  end

  def create
    @station = current_user.stations.build(station_params)
    if params[:back]
      render :new
    else
      if @station.save
        redirect_to stations_path, notice: "投稿を作成しました！"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @station.update(station_params)
      redirect_to stations_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @station.destroy
    redirect_to stations_path, notice:"投稿を削除しました！"
  end

  private

  def station_params
    params.require(:station).permit(:image, :image_cache, :content)
  end

  def set_station
    @station = Picture.find(params[:id])
  end
end