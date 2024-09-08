# app/controllers/movies_controller.rb

class MoviesController < ApplicationController
    def index
      @movies = Movie.all  # 映画のデータを取得
      @message = "映画一覧21"  # メッセージを作成
    end
    def show
      @movie = Movie.all # 映画のデータを取得
    end    
  end
  