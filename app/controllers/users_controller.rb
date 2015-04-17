class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, :only => [:show]

  def admin
  end

  def profile
    @user = current_user
  end
end
