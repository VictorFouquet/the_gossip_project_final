class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by(email: params[:user_email])
		if user && user.authenticate(params[:user_password])
			session[:user_id] = user.id
			redirect_to root_path
		else
			flash.now[:danger] = 'Combinaison email/password invalide! Veuillez réessayer!'
			render 'new'
		end
	end

	def destroy 
		session.delete(:user_id)
		redirect_to root_path
	end

end