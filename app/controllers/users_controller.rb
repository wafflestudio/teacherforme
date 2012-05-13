#coding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!
  def me
    @user = current_user
    @teachers = current_user.teachers.desc('created_at')
    @students = current_user.students.desc('created_at')
  end

  def update
    @user = current_user
    if @user.update_attributes params[:user]
      flash[:success] = "수정되었습니다."
    else
      flash[:error] = "수정에 실패했습니다."
    end
    redirect_to me_path
  end

end
