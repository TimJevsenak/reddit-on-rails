class SubscriptionsController < ApplicationController
    before_action :authenticate_user!

    def create
        @subscription = Subscription.new(subscription_params)
        @subscription.user_id = current_user.id

        @subscription.save
            
        redirect_to community_path(@subscription.community_id)
    end

    def destroy
        @community_id = params[:id]
        @user_id = current_user.id
        @subscription = Subscription.where(:community_id => @community_id, :user_id => @user_id)

        @subscription.first.destroy
        redirect_to community_path(params[:id])
    end

    def subscription_params
        params.require(:subscription).permit(:community_id)
    end
end