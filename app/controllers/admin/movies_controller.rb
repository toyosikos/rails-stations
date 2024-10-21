class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all  # すべての映画を取得
    @theaters = Theater.all
  end
  def new
    @movie = Movie.new
    if params[:theater_id].present?
      @theater = Theater.find(params[:theater_id])
      @screens = @theater.screens
    else
      redirect_to admin_movies_path
    end
  end
  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules
  end
  def create
    @movie = Movie.new(movie_params)
    @theater = Theater.find(params[:movie][:theater_id])
    @screens = @theater.screens
    if @movie.save
      # 保存が成功した場合、映画一覧ページへリダイレクト
      redirect_to admin_movies_path, notice: '映画が作成されました'
    else
      # 保存に失敗した場合、エラーメッセージを表示し、新規作成フォームを再表示
      flash.now[:error] = '映画の名前が重複しています'
      render :new
    end
  end
  def edit
    @movie = Movie.find(params[:id])
    # @movie = Movie.all
  end
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to admin_movies_path
    else
      flash.now[:error] = '映画の名前が重複しています'
      render :edit
    end
  end
  def destroy 
    @movie = Movie.find(params[:id])
    if @movie.destroy
      flash[:notice] = '削除に成功しました'
      redirect_to '/admin/movies'
    else
      flash[:notice] = '削除に失敗しました'
      @movies = Movie.all
      render :index
    end
  end
  private

  def movie_params
    params.require(:movie).permit(:Screen_id,:name, :description ,:year,:is_showing, :image_url)
  end
end
