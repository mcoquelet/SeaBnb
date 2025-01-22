class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_islands = current_user.favorites.map { |favorite| favorite.island }
  end

  def favorite
    @island = Island.find(params[:id])
    current_user.favorites.create(island: @island)
    redirect_to root_path, notice: "#{@island.name} has been added to your favorites."
  end

  def unfavorite
    @island = Island.find(params[:id])
    favorite = current_user.favorites.find_by(island: @island)
    favorite&.destroy
    redirect_to root_path, notice: "#{@island.name} has been removed from your favorites."
  end
end
