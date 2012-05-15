#coding: utf-8
class MainController < ApplicationController
  def index
    @teacher = Teacher.new
    @student = Student.new
  end
  def about
  end

  def help
  end
end
