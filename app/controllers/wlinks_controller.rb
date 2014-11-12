class WlinksController < ApplicationController
	def index
      if params[:search].present? and params[:search][:q].present? and Wlink.near(params[:search][:q]).present?
        flash.now[:success] = "Places near #{params[:search][:q]}"
        @wlinks = Wlink.near(params[:search][:q])
    elsif params[:search].present? 
        flash.now[:error] = "No links found #{params[:search][:q]}"
        @linkcat = params[:linkcat_id]
        @wlinks = Wlink.where(:linkcats => @linkcat)
    elsif params[:user_id].present?
        @user = User.find(params[:user_id])
        @wlinks =Wlink.where(:user_id => @user.id)
        @extratext = "Your listings on the site"
      else  
        @user = 0
        @linkcat = params[:linkcat_id]
        @wlinks = Wlink.where(:linkcat_id => @linkcat)
        @extratext =""
        if params[:linkcat_id].present?
          @linkcatnames = Linkcat.where(:id => @linkcat)
          
        else
          @linkcatname = ""  
        end  
      end  

  end

  def show
  	@wlink = Wlink.find(params[:id])
  end

  def new
    require_user
    @user = current_user
   
    @wlink = @user.wlinks.new
    
  end

  def create
    require_user
    
    
    @user = current_user
    @wlink = @user.wlinks.new(wlink_params)
    @wlink.save
    redirect_to linkcat_wlinks_path(params[:linkcat_id])
  end 

  def edit
    require_user
    @user = current_user
    @wlink = @user.wlinks.find(params[:id])
  
  end

  def update
    require_user
    
    
    @user = current_user
    @wlink = @user.wlinks.find(params[:wlink_id])

    if @wlink.update(wlink_params)
        flash[:success] = "Your link was updated"
       
        redirect_to wlink_path(@wlink.id)
      
    else
      flash[:error] = "Oops. There has been a problem, please retry."
      render :edit
    end
  end
  
  def destroy
    require_user
    @user = current_user
    @wlink = @user.wlinks.find(params[:id])
    @wlink.destroy
    flash[:success] = "This link was deleted succesfully"
    redirect_to root_path

       
  end

  private
  def wlink_params
    params.require(:wlink).permit(:wlinkname, :descwlink, :urlwlink, :votes_count,       :user_id, :linkcat_id)
  end

end
