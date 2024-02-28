class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = Reservation.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
    @user = current_user
  end

  def confirm
    @reservation = Reservation.new(reservation_params) #情報の入ったパラメータを渡す
    @user = current_user
    @room = @reservation.room
    if @reservation.invalid?
      render :new
    end
  end

  def create
    @reservation = Reservation.new(reservation_params) #情報の入ったパラメータを渡す
    @room = Room.find(params[:room_id])
    @user = current_user
    if params[:back] || !@reservation.save #戻るを押すor保存できなかった時
      render :new and return
    elsif @reservation.save
      flash[:notice] = "予約が完了しました" 
      redirect_to :room_reservations
    else
      flash.now[:alert] = "予約できませんでした"
      render :new
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :how_many_people, :how_many_days, :total_price, :user_id, :room_id)
  end
end
