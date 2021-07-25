class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, book_id: params[:book_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, book_id: params[:book_id]).destroy
    redirect_back(fallback_location: root_path)
  end
end