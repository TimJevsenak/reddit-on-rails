class ProfilesController < ApplicationController
    before_action :authenticate_user!, except: [:show]

    def show
        @user = User.find_by(id: params[:id])
        @posts = Post.where(user_id: @user.id)
    end

    def admin
        if ! current_user.admin?
            respond_to do |format|
                format.html { redirect_to root_path, notice: 'You need to be an admin to access admin panel.' }
                format.json { head :no_content }
              end  
        end
        @users = User.where.not(email: current_user.email)
        @communities = Community.all
        @posts = Post.all
    end

    private

end