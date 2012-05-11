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

  belongs_to :user

end
