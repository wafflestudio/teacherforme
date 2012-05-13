#coding: utf-8
class StudentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:contact]
  before_filter :find_or_create_user, :only => [:create]
  def index
    @students = Student.where(:confirmed => true)
  end
  def create
    @student = Student.new(params[:student])
    @student.user = @user
    if @user.confirmed?
      @student.confirmed = true
    end
    if @student.save
      flash[:success] = "학생 정보가 생성되었습니다."
      unless @student.user.confirmed?
        flash[:info] = "적어주신 이메일주소로 확인메일이 전송됩니다. 인증후 목록에 보이게 됩니다."
      end
      redirect_to students_path
    else
      flash[:error] = "학생 정보가 생성되지 않았습니다."
      redirect_to root_path
    end
  end

  def edit
    @student = student.find params[:id]
  end

  def update
    @student = student.find params[:id]
    if @student.update_attributes params[:student]
      flash[:success] = "성공적으로 수정되었습니다."
      redirect_to me_path
    else
      flash[:error] = "수정중에 오류가 발생했습니다."
      redirect_to me_path
    end
  end

  def complete
    @student = Student.find params[:id]
    @student.update_attribute(:complete, true)
    redirect_to me_path
  end

  private

  def find_or_create_user
    if User.where(:email => params[:student_email]).count > 0
      @user = User.where(:email => params[:student_email]).first
      if @user.valid_password?(params[:student_password])
        @user.phone = params[:student_phone]
        @user.save
        current_user = @user
      else
        flash[:error] = "Wrong password"
        redirect_to root_path and return
      end
    else
      unless params[:student_new_password] == params[:student_password_confirmation]
        flash[:error] = "Password and Password Confirmation are not same"
        redirect_to root_path and return
      end
      @user = User.new(:email => params[:student_email], :password => params[:student_new_password], :password_confirmation => params[:student_password_confirmation], :phone => params[:student_phone])
      unless @user.save
        flash[:error] = "User was not created"
        redirect_to root_path and return
      end
    end
  end
end
