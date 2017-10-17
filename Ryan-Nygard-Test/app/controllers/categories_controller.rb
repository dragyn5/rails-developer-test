class CategoriesController < ApplicationController
  access admin: [:index, :show, :new, :create, :edit, :update, :destroy], company_admin: {except: [:destroy]}

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end
   
  def create
    @category = Category.new(category_params)
    p current_user.roles
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end
   
  def edit
    @category = Category.find(params[:id])
    if logged_in?(:admin)
    else
      redirect_to controller: 'categorys', action: 'index', notice: 'must be owner of category to edit'
    end
  end

  def update
    @category = Category.find(params[:id])
    if logged_in?(:admin)
    else
      redirect_to controller: 'categories', action: 'index', notice: 'must be owner of category to edit'
    end
    if @category.update(category_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def index
    @notice = params[:notice]
    @categories = Category.all
  end
 
  def destroy
    @category = Category.find(params[:id])
    if logged_in?(:admin)
      @category.destroy
      redirect_to categories_path
    else
      redirect_to controller: 'categories', action: 'index', notice: 'must be owner of category to delete'
    end
   
  end

  private
    def category_params
      params.require(:category).permit(:title)
    end
end