# app/controllers/movies_controller.rb

class MoviesController < ApplicationController
  def index
    # キーワードによる検索
    if params[:name].present?
      @movies = Movie.where("name LIKE ? OR description LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%")
    else
      @movies = Movie.all
      @message = "映画一覧21"  # メッセージを作成
    end
  
    # 上映状態でのフィルタリング
    if params[:is_showing].present?
      @movies = @movies.where(is_showing: params[:is_showing])
  end
    end
    def show
      @movie = Movie.all # 映画のデータを取得
    end    
  end
  