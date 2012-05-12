#coding: utf-8
class RepliesController < ApplicationController

  def create
    @flag = false

    if user_signed_in?
      @reply = Reply.new(params[:reply])

      # set receiver
      if params[:type] == "teacher"
        @receiver = Teacher.find(params[:receiver_id])
      elsif params[:type] == "student"
        @receiver = Student.find(params[:receiver_id])
      else
        flash[:error] = "잘못된 인자입니다."
        (@flag = false) and return
      end

      @reply.user = current_user
      @reply.receiver = @receiver
      if @reply.save
        @receiver.contact(current_user, @reply.comment)
        flash[:success] = "연락이 전송되었습니다!"
        @flag = true
        flash.discard
      else
        flash[:error] = "연락이 저장되지 않았습니다."
        @flag = false
      end
    else
      flash[:error] = "연락하기 위해서는 로그인이 필요합니다."
      @flag = false
      flash.discard
    end

  end
end
