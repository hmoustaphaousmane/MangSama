class FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @favorites = @user.favorites
  end

  def new
    @favorite = Favorite.new
  end

  # def create
  #   @favorite = Favorite.new(favorite_params)
  #   @favorite.user = current_user
  
  #   if @favorite.save
  #     redirect_to favorites_path, notice: 'Favorite manga added successfully.'
  #   else
  #     render 'new'
  #   end
  # end

  def create
    # @user = User.find(params[:user_id])
    # @favorite = @user.favorites.build(favorite_params)
    @favorite = Favorite.new(favorite_params)
    @favorite.user = current_user
    if @favorite.save
      redirect_to user_favorites_path(current_user), notice: "Favorite added successfully"
    else
      render :new
    end
  end

  def destroy
    # @favorite = current_user.favorites.find_by(id: params[:id])
    @favorite = Favorite.find_by(user_id: current_user)
    if @favorite.destroy
      redirect_to user_favorites_path(current_user), notice: "Favorite removed successfully"
    else
      redirect_to user_favorites_path(current_user), alert: "Favorite not found"
    end
  end
  
  private
  
  def favorite_params
    params.require(:favorite).permit(:manga_id)
  end
end
