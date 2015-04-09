class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.fine(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @post.save
      redirect_to courses_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
