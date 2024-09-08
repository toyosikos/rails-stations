# app/controllers/movies_controller.rb

class MoviesController < ApplicationController
  def index
    if params[:name].present?
      # name または description に検索キーワードが含まれる映画を検索
      @movies = Movie.where("name LIKE ? OR description LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%")
    else
      # 検索キーワードがなければ全ての映画を取得
      @movies = Movie.all
      @message = "映画一覧21"  # メッセージを作成
    end
  end   
    def show
      @movie = Movie.all # 映画のデータを取得
    end    
  end
  