
class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @movie = Movie.find_by(id: params[:movie_id])
    @date = params[:date]
    @sheet = params[:sheet_id]
    @schedule = params[:schedule_id]
    @theater = params[:theater_id]
    @screen = params[:screen_id]
    
   

    unless @movie
      flash.now[:alert] = '映画が選択されていません'
      redirect_to movies_path, status: :bad_request
      return
    end

    if !@date || !@sheet
      flash.now[:alert] = '必要なパラメータがありません。'
      render :new, status: :bad_request
      return
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @movie = Movie.find(params[:reservation][:movie_id])
    @reserved_sheet = Reservation.find_by(date: params[:reservation][:date], schedule_id: params[:reservation][:schedule_id], sheet_id: params[:reservation][:sheet_id])

    if @reserved_sheet
      flash[:notice] = 'その座席はすでに予約済みです'
      redirect_to movie_reservation_path(@movie, schedule_id: params[:reservation][:schedule_id], date: params[:reservation][:date])
      return
    end

    if @reservation.save
      UserMailer.with(reservation: @reservation).reservation_completed_email.deliver_later
      flash[:success] = '予約が完了しました'
      redirect_to movies_path
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :sheet_id, :schedule_id, :email, :name,:user_id, :theater_id, :screen_id)
  end


end
