require 'pry'
class ArticlesController < ApplicationController
  before_action :set_article, only:[:show,:edit,:update,:destroy]

  def new
    @article = Article.new
  end

  #The controller would come here when we click on submit in the new form
  def create
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
  end


  def edit
  end


  def update
    #You are calling the article from the database with the article id
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
    @article.destroy
    flash[:notice] = "The article was sucessfully destroyed"
    redirect_to articles_path
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:name, :description)
  end
end
