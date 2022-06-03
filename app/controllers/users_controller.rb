class UsersController < ApplicationController
before_action :find_user ,only:[:show , :edit , :update , :destroy]  

  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    @users = User.create(user_params)
    if @users.valid?
       UserMailer.welcome_email(@users).deliver_now
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    before_mail = @user.email
    if @user.update(user_params)
      UserMailer.with(user: @user).update_mail.deliver 
      flash[:errors] = "User Updated Successfully"
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:name ,:email ,:password_digest ,:picture)
  end

  def find_user
    @user = User.find(params[:id])
  end  
end
