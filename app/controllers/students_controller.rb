class StudentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:contact]
  before_filter :find_or_create_user, :only => [:create]
  def index
    @students = Student.where("user.confirmed?" == true)
  end
  def create
    @student = Student.new(params[:student])
    @student.user = @user
    if @student.save
      flash[:success] = "Student info was created successfully"
      redirect_to students_path
    else
      flash[:error] = "Student info was not created"
      redirect_to root_path
    end
  end

  def contact
    @student = Student.find params[:id]
    @student.contact
    redirect_to teachers_path
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
