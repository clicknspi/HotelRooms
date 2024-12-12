class BookingsController < ApplicationController
  before_action :set_room, only: [:create]
  before_action :set_booking, only: [:show, :edit, :update, :validate_booking]

  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.room = @room
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path, notice: "Booking created successfully."
    else
      render "rooms/show", status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
    @booking.update(booking_params)

    if @booking.save
      redirect_to booking_path(@booking), notice: "Booking created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

 def validate_booking
    @booking.update(validated: true)
    redirect_to user_offers_path(current_user)
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user, :validated, :start_date, :end_date)
  end
end
