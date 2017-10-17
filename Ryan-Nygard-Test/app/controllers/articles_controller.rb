class ArticlesController < ApplicationController
  access all: [:index], user: [:index, :show], editor: [:index, :show, :new, :create, :edit, :update, :destroy], admin: [:index, :show, :new, :create, :edit, :update, :destroy], company_admin: {except: [:destroy]}


  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
   
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.category_id = 6
    p current_user.roles
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
   
  def edit
    @article = Article.find(params[:id])
    if logged_in?(:admin) || @article.user_id == current_user.id
    else
      redirect_to controller: 'articles', action: 'index', notice: 'must be owner of article to edit'
    end
  end

  def update
    @article = Article.find(params[:id])
    if logged_in?(:admin) || @article.user_id = current_user.id
    else
      redirect_to controller: 'articles', action: 'index', notice: 'must be owner of article to edit'
    end
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def index
    @notice = params[:notice]
    @articles = Article.all
  end
 
  def destroy
    @article = Article.find(params[:id])
    if logged_in?(:admin) || @article.user_id == current_user.id
      @article.destroy
      redirect_to articles_path
    else
      redirect_to controller: 'articles', action: 'index', notice: 'must be owner of article to delete'
    end
   
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :category_id)
    end
end
