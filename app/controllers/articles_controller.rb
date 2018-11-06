class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    a = Article.create(article_params)
    redirect_to article_path(a)
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    a = Article.find(params[:id])
    a.update(article_params)
    redirect_to article_path(a)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    a = Article.find(params[:id])
    a.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
