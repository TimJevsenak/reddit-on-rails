class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to community_post_path(@comment.post.community, @comment.post)    
    end

    def destroy
        @post_id = params[:id]
        @post = Post.find_by(:id => params[:id])
        @user_id = current_user.id
        @comment = Comment.where(:post_id => @post_id, :user_id => @user_id)

        @comment.first.destroy
        redirect_to community_post_path(@post.community, @post)
    end
  
    def new
        @comment = Comment.new
        @post = Post.find(params[:post_id])
    end

    private

    def comment_params
        params.require(:comment).permit(:post_id, :text)
    end
end