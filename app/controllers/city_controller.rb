class CityController < ApplicationController
  def show
  	@city = City.find(params[:id])
  	@city_users = @city.users
  end
end