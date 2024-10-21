
class Admin::ScreensController < ApplicationController
    def new
      @screen = Screen.new
      @theaters = Theater.all
    end
  
    def create
      @screen = Screen.new(screen_params)
      @screen.save
      redirect_to admin_movies_path
    end
  
    private
  
    def screen_params
      params.require(:screen).permit(:screen_number, :theater_id)
    end
  end
  