class UsersController < ApplicationController
	def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
        flash[:success] = "Thanks for signing up! Now please log in."
        redirect_to root_path
    else
      flash[:error] = "Oops, try again."
  	 render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
        flash[:success] = "Your user data was updated"
        redirect_to root_path
    else
      flash[:error] = "Oops. There has been a problem, please retry."
      render :edit
    end
  end

  private

  def user_params
  	params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
