class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end
  def create
    @teacher = Teacher.new(params[:teacher])
    if @teacher.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

end
