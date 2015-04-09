class LessonsController < ApplicationController
  
  before_action :authenticate_user!

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_course
    @course = Course.find(params[])

end
