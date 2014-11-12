class CommentsController < ApplicationController
	before_action :find_wlink, only:[:new, :create]

  def new
    @user = current_user
  	@comment = @wlink.comments.new
  end

  def create
    @user = current_user
  	@comment = @wlink.comments.new(comment_params)
  	@comment.save
    @linkcat = @wlink.linkcat_id
  	redirect_to linkcat_wlink_path(@linkcat, params[:wlink_id])
  end

private

	def find_wlink
  		@wlink = Wlink.find(params[:wlink_id])
	end

	def comment_params
		params.require(:comment).permit(:body, :user_id)
	end	
end
