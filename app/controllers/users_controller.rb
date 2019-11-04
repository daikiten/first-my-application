class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:edit]    
  before_action :log_in?, only: [:edit]
  before_action :now_user, only:[:edit]
  before_action :correct_user, only:[:edit]
  
  def index
    @user = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    
    @user = User.new(user_check)
    if @user.save
      flash[:success] = 'ユーザーの登録に成功しました。'
      redirect_to events_path
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end 
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_check)
      flash[:success] = '登録情報を変更しました。'
      redirect_to root_path
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end
  
  
  private 
  
  def user_check
   params.require(:user).permit(:name, :gender, :birthdate, :phone_number, :password, :password_confirmation, :email, :photo)
  end
  
  def require_user_logged_in
   unless log_in?
   redirect_to root_path
   end
  end
  
  def correct_user
    @now_user = User.find_by(id: params[:id])
    unless @user
    redirect_to root_path
    end
  end
end 
