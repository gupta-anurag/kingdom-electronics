class KingdomElectronicsController < ApplicationController
	
  def home
  	if logged_in?
      @post  = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])

  end

  def help
  end
end
