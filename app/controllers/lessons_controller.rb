class LessonsController < ApplicationController
  
  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    Lesson.create(lesson_parameter)
    redirect_to root_path
  end

  private

  def lesson_parameter
    params.require(:lesson).permit(:start_time)
  end

end
