class IslandsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @islands = Island.all

    @markers = @islands.geocoded.map do |island|
      {
        lat: island.latitude,
        lng: island.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {island: island})
      }
    end
  end

  def show
    @island = Island.find(params[:id])

    @marker = [
      {
        lat: @island.latitude,
        lng: @island.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {island: @island})
      }
    ]
  end

  def new
    @island = Island.new
    @my_islands = current_user.islands
  end

  def destroy
    @island = current_user.islands.find(params[:id])
    @island.destroy
    redirect_to new_island_path, notice: "Island successfully deleted."
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user
    if @island.save!
      flash[:notice] = "Island was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def island_params
    params.require(:island).permit(:name, :description, :location, :price, :capacity, :photo)
  end
end
