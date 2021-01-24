class HomeController < ApplicationController
  def index
    @posts_subbed ||= []
    @communities = Community.all
    @communities.each do |community|
      @is_subscribed = user_signed_in? ? Subscription.where(community_id: community.id, user_id: current_user.id).any? : false
      if @is_subscribed
        @posts_subbed += community.posts
      end
      @posts_subbed = @posts_subbed.sort_by(&:"#{:created_at}").reverse
    end

    @posts= Post.all
    @posts= Post.order(created_at: :desc)

    @communities_sidebar = Community.left_joins(:subscriptions).group(:id).order('COUNT(subscriptions.id) DESC').limit(5)
  end
end
