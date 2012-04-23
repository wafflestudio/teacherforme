class MainController < ApplicationController
  def index
    @teacher = Teacher.new
    @student = Student.new
  end
  def about
  end
end
