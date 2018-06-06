require 'pry'
class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  #The controller would come here when we click on submit in the new form
  def create
    #binding.pry
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  #This is the action which gets invoked everytime some display is placed in the screen like after creation or edit
  def show
    @article = Article.find(params[:id])
  end

  def edit
    #binding.pry
    @article = Article.find(params[:id])
  end

  def update
    #binding.pry
    #You are calling the article from the database with the article id
    @article = Article.find(params[:id])
    #Then updating it
    if @article.update(article_params)
      flash[:notice] = "The article was updated"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def index
    #To note here that we are using the instance variable of @articles instead of @article. You can use anything. I am using @articles
    @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "The article was sucessfully destroyed"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:name, :description)
  end
end
