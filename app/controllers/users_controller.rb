class UsersController < ApplicationController
  def show
    @users = User.find(params[:id])
    @items= @users.items.uniq
    @count_want=@user.want_items.count
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザ登録をしました。"
      redirect_to @user
    else
      flash[:danger] = "ユーザ登録に失敗しました。"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end  
  
end
