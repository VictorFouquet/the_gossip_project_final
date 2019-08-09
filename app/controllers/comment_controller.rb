class CommentController < ApplicationController
  
  before_action :authenticate_user, only: [:new, :create, :show]

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(content: params[:comment], 
			user: current_user,
			gossip: Gossip.find(params[:gossip_id]), 
			date: Date.today.strftime("Créé le %d/%m/%Y")
  	 )
		if @comment.save
      redirect_to gossip_path(@comment.gossip.id), :alert => "success"
    end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
    @comment = Comment.find(params[:id])
    @comment.content = params[:content]
    @comment.date = Date.today
    if @comment.save
      redirect_to gossip_path(@comment.gossip.id), :alert => "success"
    end
  end

  def destroy
  	@gossip = Comment.find(params[:id]).gossip
    Comment.find(params[:id]).destroy
    redirect_to gossip_path(@gossip.id), :alert => "comment_destroy"
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi pour accéder à toutes les fonctionnalités du site !"
      redirect_to new_session_path
    end
  end
end