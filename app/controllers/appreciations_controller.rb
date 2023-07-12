class AppreciationsController < ApplicationController
    before_action :authenticate_user!
  
    def like
      @manga = Manga.find(params[:manga_id])
      current_user.like(@manga)
      redirect_to @manga
    end
  
    def dislike
      @manga = Manga.find(params[:manga_id])
      current_user.dislike(@manga)
      redirect_to @manga
    end
end  