class LessonsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_course
  respond_to :html, :js


  def show
    @lessons = @course.lessons.all
    @lesson = @course.lessons.find(params[:id])
    if @lesson.wistia_video != nil
      @file = Wistia::Media.find(@lesson.wistia_video).attributes
      @video = @file["embedCode"]
      @video_time = @file["duration"]
      # return JSON.parse(response.body)["hashed_id"]
    end
  end

  def new
    @lesson = @course.lessons.new
  end

  def create
    @lesson = @course.lessons.build(lesson_params)
    if @lesson.valid? && (params["lesson"]["video_url"] != nil)

      @lesson.wistia_video = post_video_to_wistia(params["lesson"]["video_url"].tempfile)
      @lesson.save

      flash[:success] = "Lesson created!"
      redirect_to @course
    else
      flash[:alert] = "Something went wrong. Try again!"
      redirect_to new_course_lesson_path
    end

  end

  def edit
    @lesson = @course.lessons.find(params[:id])
  end

  def update
    @lesson = @course.lessons.find(params[:id])
    if @lesson.update_attributes(lesson_params)
      if params["lesson"]["video_url"]
        @lesson.wistia_video = update_video_to_wistia(params["lesson"]["video_url"])
        @lesson.save
      end
      flash[:success] = "Lesson updated!"
      redirect_to @course
    else
      flash[:alert] = "Something went wrong. Try again!"
      redirect_to edit_course_lesson_path
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to @course
  end

  def post_video_to_wistia(video_file)
    
    conn = Faraday.new(:url => 'https://upload.wistia.com/') do |conn|
      conn.request :multipart
      conn.request :url_encoded
      conn.adapter :net_http
    end

    response = conn.post '/', {
      api_password: ENV['WISTIA_API_PASSWORD'],
      file: Faraday::UploadIO.new(video_file.path, 'application/octet-stream')
    }

    return JSON.parse(response.body)["hashed_id"]
  end

  def update_video_to_wistia(video_file)
    
    conn = Faraday.new(:url => 'https://upload.wistia.com/') do |conn|
      conn.request :multipart
      conn.request :url_encoded
      conn.adapter :net_http
    end

    response = conn.post '/', {
      api_password: ENV['WISTIA_API_PASSWORD'],
      file: Faraday::UploadIO.new(video_file.path, 'application/octet-stream')
    }
    return JSON.parse(response.body)["hashed_id"]
  end

    
  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def lesson_params
    params.require(:lesson).permit(:name, :description, :content, :video_url, :video_time, :exercise_name, :exercise_content, :complete, :teacher_id)
  end

end
