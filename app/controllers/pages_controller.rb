class PagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to profile_path(current_user)
    end
    @user = User.new
    @courses = Course.all
  end
end