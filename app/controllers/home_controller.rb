class HomeController < ApplicationController
  def index
    @communities = Community.all
    @communities_sidebar = Community.left_joins(:subscriptions).group(:id).order('COUNT(subscriptions.id) DESC').limit(5)
  end
end
