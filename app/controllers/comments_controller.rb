class CommentsController < ApplicationController
    def create 
        @comment = Comment.new(params[:comment])
        @comment.movie_id = params[:movie_id]
        @comment.user_id  = current_user.id

        if @comment.save 
            respond_to do |format|
                format.json {render json: @comment}
            end
        else
            respond_to do |format|
                format.json {render json: @comment}
            end
        end
    end
end