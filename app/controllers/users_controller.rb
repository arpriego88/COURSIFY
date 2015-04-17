class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, :only => [:show]
  
  def show
    @user = current_user
  end

  def admin
  end
end
