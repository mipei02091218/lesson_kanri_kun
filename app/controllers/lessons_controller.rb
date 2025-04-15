class LessonsController < ApplicationController
  
  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    Lesson.create(lesson_parameter)
    redirect_to lessons_path
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    lesson = Lesson.find(params[:id])
    lesson.update(lesson_parameter)
    redirect_to lessons_path
  end

  private

  def lesson_parameter
    params.require(:lesson).permit(:start_time)
  end

end
