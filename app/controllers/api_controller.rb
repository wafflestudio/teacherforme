class ApiController < ApplicationController
  def check_email
    if User.where(:email => params[:email]).count > 0
      render :json => {:res => "exists"}
    else
      render :json => {:res => "non"}
    end
  end
end
