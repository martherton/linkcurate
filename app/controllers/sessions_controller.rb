class SessionsController < ApplicationController
	def new

  end

  def create
  	@username = params[:session][:username]
  	@password = params[:session][:password]
  	@user = User.find_by(username: @username)

  	if @user.present? and @user.authenticate(@password)  #the bcrypt check that the password is correct
  		session[:user_id] = @user.id 
  		redirect_to root_path

  	else
  		flash[:error] = "Ooops!  Try Again"
  		render :new
  	end	
  		
  end		
  	def destroy
  		reset_session
  		flash[:success] = "You are now logged out."
  		redirect_to root_path
  	end	
end
