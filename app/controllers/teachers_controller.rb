class TeachersController < ApplicationController
  before_filter :authenticate_user!, :only => [:contact]
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

  def contact
    @teacher = Teacher.find params[:id]
    @teacher.contact
    redirect_to students_path
  end


end
