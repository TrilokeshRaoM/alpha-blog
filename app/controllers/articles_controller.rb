class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    #binding.pry
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def show

  end
  private
  def article_params
    params.require(:article).permit(:name, :description)
  end
end
