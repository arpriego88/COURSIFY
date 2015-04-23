class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, :only => [:show]

  def admin
    @user = current_user
    @course = Course.find_by(params[teacher_id: current_user])
    @lessons = @course.lessons
    # Add security measure to redirect non-admins
    @exercises = Exercise.all
    @projects = Wistia::Project.find('87ii0lncvc')
    @media = Wistia::Media.all
    # @media_id = Wistia::Media.find('hashed_id')
    @stats = Wistia::Stats::Media.find('mferaacbli')
  end

  def profile
    @user = current_user
  end
end


# @lesson = @course.lessons.find(params[:id])
#     if @lesson.wistia_video != nil
#       @file = Wistia::Media.find(@lesson.wistia_video).attributes
#       @video = @file["embedCode"]
#       @video_time = @file["duration"]
#     end