class ExercisesController < ApplicationController

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      flash[:success] = "Exercise Created"
      redirect_to root_path
    else
      flash[:alert] = "Please fill in every field and ensure the due date is in the future."
      render :new
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
      if @exercise.update(exercise_params)
        flash[:success] = "Exercise Has Been Updated" 
        redirect_to root_path
      else
        render :edit
      end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy    
  end

  def show
  end

  private

  def exercise_params
    params.require(:exercise).permit(:response)
  end
end
