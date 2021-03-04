class FavoritesController < ApplicationController
  before_action :book_params

  def create
    @favorite = current_user.favorites.create(book_id: @book.id)
    @book = Book.find(params[:book_id])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    @favorite.destroy
    # redirect_back(fallback_location: root_path)
  end

  private
  def book_params
    @book = Book.find(params[:book_id])
  end

end
