class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
    
    def create
        @manga = Manga.find(params[:manga_id])
        @comment = @manga.comments.build(comment_params)

        if @comment.save
        flash[:success] = "Commentaire créé avec succès"
        else
        flash[:error] = "Échec de la création du commentaire"
        end

        redirect_to manga_path(@manga)
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
  