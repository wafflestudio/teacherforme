class Teacher
  include Mongoid::Document
  include Mongoid::Timestamps

  ELEMENTRY = "ele"
  MIDDLE1 = "mid1"
  MIDDLE2 = "mid2"
  MIDDLE3 = "mid3"
  HIGH1 = "high1"
  HIGH2 = "high2"
  HIGH3 = "high3"
  GENERAL = "general"

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
