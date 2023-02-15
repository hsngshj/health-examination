class UsersController < ApplicationController
  before_action :require_user_logged_in, except: [:new, :create]
  before_action :set_current_user, except: [:new, :create]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def show
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = 'プロフィールを変更しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'プロフィールの変更に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @user.destroy
    
    flash[:success] = 'アカウントを削除しました'
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :gender, :birth_date, :password, :password_confirmation)
    end
    
    def set_current_user
      @user = current_user
    end
    
    def correct_user
      unless @user == User.find_by(id: params[:id])
        redirect_to root_url
      end
    end
end
