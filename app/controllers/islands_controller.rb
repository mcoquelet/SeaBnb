class IslandsController < ApplicationController
  def index
    @islands = Island.all
  end

  def show
    @island = Island.find(params[:id])
  end

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user
    if @island.save!
      redirect_to island_path(@island), notice: "Island was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def island_params
    params.require(:island).permit(:name, :description, :location, :longitude, :latitute, :price, :capacity)
  end

end
