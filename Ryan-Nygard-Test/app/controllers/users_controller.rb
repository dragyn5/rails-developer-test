# class UsersController < ApplicationController
#   def index
#     @users = User.all
#   end

#   def create
#     @user = User.new(params[:user])

#     if params[:user][:password].blank?
#       params[:user].delete(:password)
#       params[:user].delete(:password_confirmation)
#     end

#     respond_to do |format|
#       if @user.save
#         format.html { redirect_to users_path, notice: 'User was successfully created.' }
#       else
#         format.html { render action: "new" }
#       end
#     end
#   end

#   def show
#     @user = User.find(params[:id])
#   end

#   def edit
#      @user = User.find(params[:id])
#    end


#    def update
#      @user = User.find(params[:id])
#       if params[:user][:password].blank?
#         params[:user].delete(:password)
#         params[:user].delete(:password_confirmation)
#       end
#      if @user.update(user_params)
#        redirect_to users_path
#      else
#        render 'edit'
#      end
#    end

#   def destroy
#     @user = User.find(params[:id])
#     @user.destroy!

#     respond_to do |format|
#       format.json { respond_to_destroy(:ajax) }
#       format.xml  { head :ok }
#       format.html { respond_to_destroy(:html) }      
#     end
#   end

#   private

#   def user_params
#     params.require(:user).permit(:email, :password, :password_confirmation, :roles)
#   end

# end

class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update(user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end 

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :roles)
  end
end