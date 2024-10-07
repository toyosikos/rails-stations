class Admin::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.new
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    redirect_to admin_schedules_path
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.save
    redirect_to admin_movie_path(@schedule.movie)
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to admin_schedules_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:movie_id, :start_time, :end_time)
  end
end