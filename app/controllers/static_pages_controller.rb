class StaticPagesController < ApplicationController
  def home
    # note we are double checking if signed in
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about 
  end

  def contact
  end
end
