
class Admin::TheatersController < ApplicationController
    def new
      @theater = Theater.new
    end
  
    def create
      @theater = Theater.new(theater_params)
      @theater.save
      redirect_to admin_movies_path
    end
  
    private
  
    def theater_params
      params.require(:theater).permit(:name)
    end
  end
  