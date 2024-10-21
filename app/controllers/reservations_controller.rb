# 顧客用の予約情報コントローラ
class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @schedule = Schedule.find_by(id: params[:schedule_id])
    @movie = Movie.find_by(id: params[:movie_id])
    @date = params[:date]
    # スケジュールが見つからない場合は404を返す
    unless @schedule
      head :not_found # 404 Not Found を返す
      return
    end
  
    # 必須のパラメータが不足している場合は404を返す
    if params[:date].blank? || params[:sheet_id].blank?
      head :not_found # 404 Not Found を返す
      return
    end
  
    # 必要な場合はここで @sheet に値を設定
    @sheet = params[:sheet_id]
  end
  
  
    def create
      @reservation = Reservation.new(reservation_params)
      
      if @reservation.save
        handle_successful_reservation
        ReservationMailer.reservation_confirmation(current_user, @reservation).deliver_later
      else
        handle_failed_reservation
      end
    rescue ActiveRecord::RecordNotUnique
      handle_failed_reservation
    end
  
    private
  
    def reservation_params
      params.require(:reservation).permit(:name, :email, :schedule_id, :sheet_id)
    end
  
    def handle_successful_reservation
      flash[:notice] = "映画の予約に成功しました"
      redirect_to movie_path(@reservation.schedule.movie.id)
    end
  
    def handle_failed_reservation
      flash[:error] = 'その座席はすでに予約済みです'
      redirect_to movie_reservation_path(@reservation.schedule.movie.id,
                                       schedule_id: @reservation.schedule_id,
                                       date: params[:date])
      
    end
    def set_current_user
        @current_user = current_user # current_userがnilでないことを確認する
        logger.debug("Current User: #{@current_user.inspect}") # デバッグ用
    end
  end