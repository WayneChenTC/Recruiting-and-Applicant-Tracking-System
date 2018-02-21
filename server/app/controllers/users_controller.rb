class UsersController < ApplicationController
 def new

 end

  def create
      # allow for creating users without being logged in.
      @user = User.new(user_params)
      @user.save
      redirect_to @user


  end

 def show
   if !logged_in?
     redirect_to login_path
   else
     @user = User.find(params[:id])
   end

 end

 def index
   if !logged_in?
     redirect_to login_path
   else
     @users = User.all
   end


 end

 def destroy
   if logged_in? and current_user.role == 'admin'


     @user = User.find(params[:id])
     if @user.role != 'admin'
       @user.destroy
       respond_to do |format|
         format.html { redirect_to users_path,
                                   notice: 'User was successfully destroyed.' }
         format.json { head :no_content }
       end

     end

   end
 end

  private
  def user_params
    params.require(:user).permit(:email, :password, :role)
  end
end
