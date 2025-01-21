class BookingsController < ApplicationController
  before_action :set_island, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.island = @island
    @booking.user = current_user
    if @booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.where(user: current_user)
  end

  private

  def set_island
    @island = Island.find(params[:island_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guest_number)
  end
end