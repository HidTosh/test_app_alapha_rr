class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles= Article.all
  end

  def show
    #debugger
  end

  def new
    @article = Article.new
  end

  def create 
    #render plain: params[:article]
    @article = Article.new(article_params)
    @article.user =  User.first
    #render plain: @article.inspect
    if @article.save 
      flash[:notice] = "Article was created successfuly." #use flash helper
      #redirect_to article_path(@article) #get last id insert article
      redirect_to @article #get last id insert article
    else
        render 'new'
    end
  end

  def edit 
  end

  def update
    #debugger
    if @article.update(article_params)
        flash[:notice] = "Article was udated success"
        redirect_to @article
    else 
        render 'edit'
    end

  end

  def destroy 
    #debugger
    @article.destroy  
    redirect_to article_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end