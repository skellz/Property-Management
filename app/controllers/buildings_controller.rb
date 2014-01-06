class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :destroy] 

  def index
    @buildings = Building.all
  end

  def show

  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: "Building was successfully created"}
      else
        format.html { render action: 'new'}
      end
    end
  end

  private
  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:street, :city, :state, :description, :zip_code)
  end

end