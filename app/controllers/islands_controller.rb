class IslandsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @islands = Island.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR description ILIKE :query OR location ILIKE :query"
      @islands = @islands.where(sql_subquery, query: "%#{params[:query]}%")
    end

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

    @booking = Booking.new
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

    respond_to do |format|
      if @island.save
        format.html { redirect_to island_path(@island) }
        format.json # Follows the classic Rails flow and look for a create.json view
      else
        format.html { render "island/new", status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def island_params
    params.require(:island).permit(:name, :description, :location, :price, :capacity, photos: [])
  end
end
