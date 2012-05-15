#coding: utf-8
class RegistrationsController < Devise::RegistrationsController
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
