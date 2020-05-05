class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.book_id = params[:book_id]
        if @comment.save
           redirect_to book_path(params[:book_id]) 
        else
           redirect_to book_path(params[:book_id]) 
           flash[:danger] = "Comment can't be blank" #renderをつかっていいねするとエラー起こる
        end
    end

    def destroy
        comment = Comment.find(params[:comment_id])
        comment.destroy
        redirect_to book_path(params[:book_id]) 
    end
    private
    def comment_params
        params.require(:comment).permit(:comment)
    end
end
