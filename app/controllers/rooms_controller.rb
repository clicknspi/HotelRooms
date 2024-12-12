class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :indexbefore_action :set_room, only: [:show, :edit, :update]

    def index
      @rooms = Room.all
    end

    def show
      @booking = Booking.new
    end

    def new
      @room =   Room.new
      @user = current_user
    end

    def create
      @sroom = Romm.new(room_params)
      @room.user = current_user
      if @room.save
        redirect_to rooms_path(@room), notice: "Room created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      @room.update(room_params)
      if @room.save
        redirect_to rooms_path(@room), notice: "Room created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(
      :photo, :name, :description,
      :price,
    )
  end
end


end
