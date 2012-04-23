class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def contact
    @student = Student.find params[:id]
    @student.contact
    redirect_to teachers_path
  end

end
