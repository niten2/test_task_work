class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = Favorite.where(user: current_user)
  end

  def create
    @favorite = Favorite.create(favorable_id: params[:id], favorable_type: params[:type], user: current_user)
  end

  def destroy
    @favorite = Favorite.find(params[:id]).destroy
  end
end
