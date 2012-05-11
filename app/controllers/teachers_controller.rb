class TeachersController < ApplicationController
  before_filter :authenticate_user!, :only => [:contact]
  before_filter :find_or_create_user, :only => [:create]

  def index
    @teachers = Teacher.all
  end
  def create
    @teacher = Teacher.new(params[:teacher])
    @teacher.user = @user
    if @teacher.save
      flash[:success] = "Teacher info was created successfully"
      redirect_to teachers_path
    else
      flash[:error] = "Teacher info was not created"
      redirect_to root_path
    end
  end

  def contact
    @teacher = Teacher.find params[:id]
    @teacher.contact
    redirect_to students_path
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
