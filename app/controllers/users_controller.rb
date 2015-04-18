class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, :only => [:show]

  def admin
    # Add security measure to redirect non-admins
    @exercises = Exercise.all
  end

  def profile
    @user = current_user
  end
end
