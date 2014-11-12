class LinkcatsController < ApplicationController
	def index
      if params[:user_id].present?
        @user = User.find(params[:user_id])
        @linkcats =Linkcat.where(:user_id => @user.id)
        @extratext = "Your listings on the site"
      else  
        @user = 0
        @linkcats = Linkcat.all
        @extratext =""
      end  

  end

  def show
  	@linkcat = Linkcat.find(params[:id])
  end

  def new
    require_user
    @user = current_user
    @linkcat = @user.linkcats.new
  end

  def create
    require_user
    @user = current_user
    @linkcat = @user.linkcats.new(linkcat_params)
    if @linkcat.save
    redirect_to root_path
  else
    render :new
   end 
  end 

  def edit
    require_user
    @user = current_user
    @linkcat = @user.linkcats.find(params[:id])
  end

  def update
    require_user
    @user = current_user
    @linkcat = @user.linkcats.find(params[:id])

    if @linkcat.update(linkcat_params)
        flash[:success] = "Your linkcat was updated"
        redirect_to linkcat_path(@linkcat.id)
    else
      flash[:error] = "Oops. There has been a problem, please retry."
      render :edit
    end
  end
  
  def destroy
    require_user
    @user = current_user
    @linkcat = @user.linkcats.find(params[:id])
    @linkcat.destroy
    flash[:success] = "This linkcat was deleted succesfully"
    redirect_to root_path

       
  end

  private
  def linkcat_params
    params.require(:linkcat).permit(:linkcatname, :descofcont, :user_id)
  end

end
