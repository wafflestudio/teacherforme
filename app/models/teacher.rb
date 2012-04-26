#coding: utf-8
class Teacher
  include Mongoid::Document
  include Mongoid::Timestamps

  ELEMENTRY = ["ele","초등"]
  MIDDLE1 = ["mid1","중1"]
  MIDDLE2 = ["mid2","중2"]
  MIDDLE3 = ["mid3","중3"]
  HIGH1 = ["high1","고1"]
  HIGH2 = ["high2","고2"]
  HIGH3 = ["high3","고3"]
  GENERAL = ["general","일반"]

  field :year, type: Array # Student's age

  field :pay, type: Integer
  field :age, type: Integer
  field :sex, type: Boolean
  field :want_sex, type: Integer
  field :subject
  field :phone
  field :email
  field :location
  field :comment

  belongs_to :university
end
