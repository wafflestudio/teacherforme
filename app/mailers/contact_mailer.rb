#coding: utf-8
class ContactMailer < ActionMailer::Base
  default from: "contact@teacherfor.me"

  def contact_to_teacher_email(user,teacher,message)
    @user = user
    @teacher = teacher
    @message = message
    mail(:to => @teacher.user.email, :subject => "Teacher for me에서 학생이 관심을 표현했습니다!")
  end
  def contact_to_student_email(user,student,message)
    @user = user
    @student = student
    @message = message
    mail(:to => @student.user.email, :subject => "Teacher for me에서 선생님이 관심을 표현했습니다!")
  end
end
