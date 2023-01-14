class BookingsController < ApplicationController
  before_action :set_mask, only: [:new, :create]

  def index
     @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.mask = @mask
    @booking.user = current_user
    # It has to be this way because of the way flatpicker works with the dates"
    # @booking.start_date = params[:booking][:start_date].split("to")[0].strip
    # @booking.end_date = params[:booking][:start_date].split("to")[1].strip
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

private

  def set_mask
    @mask = Mask.find(params[:mask_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
