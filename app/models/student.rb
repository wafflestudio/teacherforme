#coding: utf-8
class Student
  include Mongoid::Document
  include Mongoid::Timestamps

  field :year, type: String # Student's age

  field :pay, type: Integer
  field :sex, type: Boolean
  field :want_sex, type: Integer
  field :subject
  field :location
  field :comment
  field :confirmed, type: Boolean, default: false

  belongs_to :user
  has_many :replies, as: :receiver

  def confirmed?
    self.confirmed
  end

  def want_sex_str
    if self.want_sex == 0
      "남녀모두"
    elsif self.want_sex == 1
      "여자"
    else
      "남자"
    end
  end

  def year_str
    res = case self.year
      when "ele" then "초등"
      when "mid1" then "중1"
      when "mid2" then "중2"
      when "mid3" then "중3"
      when "high1" then "고1"
      when "high2" then "고2"
      when "high3" then "고3"
      when "general" then "일반"
      else "정보없음"
    end
  end
  def contact(current_user, message)
    ContactMailer.contact_to_student_email(current_user,self,message).deliver
  end
end
