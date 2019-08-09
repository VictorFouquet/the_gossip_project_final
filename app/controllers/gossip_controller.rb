class GossipController < ApplicationController

  before_action :authenticate_user, only: [:new, :create, :show]
  before_action :corresponding_user, only: [:edit, :update, :destroy]

  def index
    @gossips = Gossip.all
    @gossips = @gossips.sort_by{|gossip| gossip[:date]}
    @gossips = @gossips.reverse
  end

  def show
  	@gossip = Gossip.find(params[:id])
    @comments = @gossip.comments
  end

  def new
    @gossip = Gossip.new
  end

 def create
   @gossip = Gossip.new(title:params[:title], content:params[:content], date: Date.today.strftime("Créé le %d/%m/%Y"))
   @gossip.user = current_user
   if @gossip.save
    redirect_to({ :action=>'index' }, :alert => "success")
   else 
    render :new
  end
 end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.title = params[:title]
    @gossip.content = params[:content]
    if @gossip.save
      redirect_to({ :action=>'index' }, :alert => "success")
    else 
      render :edit
    end
  end

  def destroy
    Gossip.find(params[:id]).destroy
    redirect_to({ :action=>'index' }, :alert => "destroy")
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi pour accéder à toutes les fonctionnalités du site !"
      redirect_to new_session_path
    end
  end

  def corresponding_user
    unless current_user == Gossip.find(params[:id]).user
      flash[:danger] = "Impossible d'éditer le gossip si tu n'en es pas l'auteur !"
      redirect_to gossip_path(params[:id])
    end
  end
end
