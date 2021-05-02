class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  def index
    @buildings = Building.all
  end

  def new
    if params[:back]
      @building = Building.new(building_params)
    else
      @building = Building.new
    end
  end

  def confirm
    @building = current_user.buildings.build(building_params)
    render :new if @building.invalid?
  end

  def create
    @building = current_user.buildings.build(building_params)
    if params[:back]
      render :new
    else
      if @building.save
        redirect_to buildings_path, notice: "情報を追加しました！"
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
      redirect_to buildings_path, notice: "情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @building.destroy
    redirect_to buildings_path, notice:"情報を削除しました！"
  end

  private

  def building_params
    params.require(:building).permit(:image, :image_cache, :content)
  end
end