class BuildingsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @buildings = Building.all
  end

  def new
    if params[:back]
      @building = Building.new(building_params)
      2.times{@building.stations.build}
    else
      @building = Building.new
      2.times{@building.stations.build}
    end
  end

  def create
    @building = Building.new(building_params)
    if params[:back]
      render :new
    else
      if @building.save
        redirect_to buildings_path
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
    if @building.update(building_params)
      redirect_to buildings_path
    else
      render :edit
    end
  end

  def destroy
    @building.destroy
    redirect_to buildings_path
  end

  private

  def building_params
    params.require(:building).permit(:name, :price, :address, :old, :comment,
                                     station_attributes: [:name, :route_name, :time, :id])
  end

  def set_params
    @building = Building.find(params[:id])
  end
end