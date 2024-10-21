class Admin::ReservationsController < ApplicationController
    before_action :reserved_sheet, only: %i[create update]
  
    def index
      @reservations = Reservation.all
    end
  
    def new
      @reservation_new = Reservation.new
      @sheets = Sheet.all
      @movies = Movie.all
      @schedules = Schedule.all

    end
  
    def show
      @reservation = Reservation.find(params[:id])
      @schedules = Schedule.all
      @sheets = Sheet.all
      @movies = Movie.all
    end
  
    def create
      @reservation_new = Reservation.new(reservation_params)
      @schedules = Schedule.all
      @sheets = Sheet.all
      @movies = Movie.all
  
      if @reserved_sheet
        flash[:notice] = 'その座席はすでに予約済みです'
        render :new, status: :bad_request
        return
      end
  
      if @reservation_new.save
        redirect_to admin_reservations_path
      else
        flash[:notice] = '投稿に失敗しました'
        render :new, status: :bad_request
      end
    end
  
    def update
      @reservation = Reservation.find(params[:id])
  
      if @reserved_sheet
        flash[:notice] = 'その座席はすでに予約済みです'
        redirect_to admin_reservations_path
        return
      end
  
      if @reservation.update(reservation_params)
        redirect_to admin_reservations_path
      else
        render :edit
      end
    end
  
    def destroy
      @reservation = Reservation.find(params[:id])
      @reservation.destroy
      redirect_to admin_reservations_path
    end
  
    private
  
    def reservation_params
      params.require(:reservation).permit(:name, :email, :schedule_id, :date, :sheet_id)
    end
  
    def reserved_sheet
      @reserved_sheet = Reservation.find_by(date: params[:reservation][:date],
                                            schedule_id: params[:reservation][:schedule_id], sheet_id: params[:reservation][:sheet_id])
    end
  end