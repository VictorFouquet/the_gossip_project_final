class LikeController < ApplicationController

	def create
		Like.create(user: current_user, gossip: Gossip.find(params[:gossip]))
		redirect_to root_path
	end

	def destroy
		puts params
		Like.find(params[:id]).destroy
    redirect_to root_path
	end

end