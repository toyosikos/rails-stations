class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all  # すべての映画を取得
  end
  def new
    @movie = Movie.new
  end
  def create
    @movie = Movie.new(movie_params)
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
    params.require(:movie).permit(:name, :description ,:year,:is_showing, :image_url)
  end
end
