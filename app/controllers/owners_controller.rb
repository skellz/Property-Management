class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :destroy] 

  def index
  end

  def show

  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
        format.html { redirect_to @owner, notice: "Owner was successfully created"}
      else
        format.html { render action: 'new'}
      end
    end
  end

  private
  def set_owner
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :company, :email)
  end
end