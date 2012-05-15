#coding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!

  def me
    @user = current_user
    @teachers = current_user.teachers.desc('created_at')
    @students = current_user.students.desc('created_at')
  end

end
