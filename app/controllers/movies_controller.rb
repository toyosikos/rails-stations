# app/controllers/movies_controller.rb

class MoviesController < ApplicationController
  def show
    Rails.logger.debug "Params ID: #{params[:id]}"
    @movie = Movie.find(params[:id]) # パラメータに含まれる映画IDを元に映画を取得
    
    if @movie.nil?
      redirect_to movies_path, alert: "Movie not found"
    else
      @schedules = @movie.schedules
    end
  end  
  def reservation
    @movie = Movie.find(params[:movie_id])

    if params[:schedule_id].blank? || params[:date].blank?
      redirect_to movie_path(@movie), alert: "スケジュールと日付を選択してください"
      return
    end
    @schedule = Schedule.find(params[:schedule_id])
    @date = params[:date]
    @sheets = Sheet.all

    # ここで座席表の情報を取得する処理を追加
  end
  def index
  @movies = Movie.all
  # ランキングページからの遷移
  @movies = @movies.where(name: params[:name]) if params[:name].present?
  # キーワードでの絞り込み
  @movies = @movies.looks(params[:keyword]) if params[:keyword].present?

  # 公開中または公開予定の絞り込み
  if params[:is_showing] == '1'
    @movies = @movies.where(is_showing: true)
  elsif params[:is_showing] == '0'
    @movies = @movies.where(is_showing: false)
  end
  end
  def handle_empty_reservation(movie_id, schedule)
    return if schedule.present?

    flash[:alert] = '日付とスケジュールを選択してください。'
    redirect_to movie_path(movie_id)
  end

end
  