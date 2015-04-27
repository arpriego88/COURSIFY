class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, :only => [:show]

  def admin
    # Add security measure to redirect non-admins
    @exercises = Exercise.all
  end

  def profile
    @user = current_user
    @video = []
    @user.courses.each do |course|
      course.lessons.each do |lesson|
        @wistia = lesson.wistia_video
        @video << Wistia::Stats::Media.get(@wistia)
      end
    end
    @video_map = []
    @user.courses.each do |course|
      course.lessons.each do |lesson|
        @wistia = lesson.wistia_video
        @video_map << Wistia::Stats::Events.get(@wistia)
      end
    end
  end

end
