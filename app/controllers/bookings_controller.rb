class BookingsController < ApplicationController
  before_action :set_island, only: [:create]
  before_action :authenticate_user!, only: [:create]

  def create
    @booking = Booking.new(booking_params)
    @booking.island = @island
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path, notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.where(user: current_user).all
    @current_bookings = Booking.where(user: current_user).where("end_date > ?", Date.today)
    @past_bookings = Booking.where(user: current_user).where("end_date < ?", Date.today)
  end

  private

  def set_island
    @island = Island.find(params[:island_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guest_number)
  end
end
