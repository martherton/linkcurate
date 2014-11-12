class VotesController < ApplicationController
	def create
		@wlink = Wlink.find(params[:wlink_id])
		@vote = @wlink.votes.new(wlink_id: params[:wlink_id], ip_address: request.ip)
		@vote.save
		@linkcatid = @wlink.linkcat_id
		redirect_to linkcat_wlinks_path(@linkcatid)
	end	
end
