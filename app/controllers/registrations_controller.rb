class RegistrationsController < ApplicationController
    before_action :authenticate_user!

    def destroy
        @user = User.find_by(id: params[:id])
        if ! current_user.admin?
            respond_to do |format|
                format.html { redirect_to root_path, notice: 'You need to be an admin to access admin panel.' }
                format.json { head :no_content }
            end  
        end

        @communities = Community.where(user_id: @user.id)
        @communities.each do |community|
            community.destroy
        end
        @posts = Post.where(user_id: @user.id)
        @posts.each do |post|
            @votes = Vote.where(post_id: post.id)
            @votes.each do |vote|
                vote.destroy
            end
            @comments = Comment.where(post_id: post.id)
            @comments.each do |comment|
                comment.destroy
            end
            post.destroy
        end

        @subscriptions = Subscription.where(user_id: @user.id)
        @subscriptions.each do |subscription|
        subscription.destroy
        end

        @user.destroy
        respond_to do |format|
        format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
        end
    end
end