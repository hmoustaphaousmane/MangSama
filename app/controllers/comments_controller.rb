class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
    
    def create
        @manga = Manga.find(params[:manga_id])
        @comment = @manga.comments.build(comment_params)
        @comment.user = current_user
        

        if @comment.save!
            redirect_to manga_path(@manga), notice: "Comment added!!!"
        else
            redirect_to manga_path(@manga), notice: "Try again, your comment ended with some issues!!!"
        end

        
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            flash[:success] = 'Object was successfully deleted.'
        else
            flash[:error] = 'Something went wrong'
        end

    end
    

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
  