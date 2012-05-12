#coding: utf-8
class ContactMailer < ActionMailer::Base
  default from: "contact@teacherfor.me"

  def contact_to_teacher_email(user,teacher)
    @user = user
    @teacher = teacher
    mail(:to => @teacher.user.email, :subject => "Teacher for me에서 학생이 관심을 표현했습니다!")
  end
end
