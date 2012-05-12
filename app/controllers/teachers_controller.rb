#coding : utf-8
class TeachersController < ApplicationController
  before_filter :authenticate_user!, :only => [:contact]
  before_filter :find_or_create_user, :only => [:create]

  def index
    @teachers = Teacher.where(:confirmed => true)
    #@teachers = Teacher.all
    @reply = Reply.new
  end
  def create
    @teacher = Teacher.new(params[:teacher])
    @teacher.user = @user
    if @user.confirmed?
      @teacher.confirmed = true
    end
    if @teacher.save
      flash[:success] = "선생님 정보가 생성되었습니다."
      unless @teacher.user.confirmed?
        flash[:info] = "적어주신 이메일주소로 확인메일이 전송됩니다. 인증후 목록에 보이게 됩니다."
      end
      redirect_to teachers_path
    else
      flash[:error] = "선생님 정보가 생성되지 않았습니다."
      redirect_to root_path
    end
  end

  private

  def find_or_create_user
    if User.where(:email => params[:teacher_email]).count > 0
      @user = User.where(:email => params[:teacher_email]).first
      if @user.valid_password?(params[:teacher_password])
        @user.phone = params[:teacher_phone]
        @user.save
        current_user = @user
      else
        flash[:error] = "Wrong password"
        redirect_to root_path and return
      end
    else
      unless params[:teacher_new_password] == params[:teacher_password_confirmation]
        flash[:error] = "Password and Password Confirmation are not same"
        redirect_to root_path and return
      end
      @user = User.new(:email => params[:teacher_email], :password => params[:teacher_new_password], :password_confirmation => params[:teacher_password_confirmation], :phone => params[:teacher_phone])
      unless @user.save
        flash[:error] = "User was not created"
        redirect_to root_path and return
      end
    end
  end


end
