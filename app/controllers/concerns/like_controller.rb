class LikeController < ApplicationController
  
	def new
	end

  def create
    @like = Like.new(user: current_user, gossip: Gossip.find(params[:gossip]))
    @like.save
    redirect_to root_path
  end
  
end