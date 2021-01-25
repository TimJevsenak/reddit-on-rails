class VotesController < ApplicationController
    before_action :authenticate_user!

    def create
        @vote = Vote.new(vote_params)
        @vote.user_id = current_user.id

        @vote.save

        redirect_to community_post_path(@vote.post.community_id, @vote.post_id)
    end

    def destroy
        @post_id = params[:id]
        @post = Post.find_by(:id => params[:id])
        @user_id = current_user.id
        @vote = Vote.where(:post_id => @post_id, :user_id => @user_id)

        @vote.first.destroy
        redirect_to community_post_path( @post.community, @post)
    end

    private

    def vote_params
        params.require(:vote).permit(:post_id, :upvote)
    end

end