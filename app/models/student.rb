class Student
  include Mongoid::Document
  include Mongoid::Timestamps

  field :pay, type: Integer
  field :age, type: Integer
  field :sex, type: Boolean
  field :want_sex, type: Integer
  field :subject
  field :phone
  field :email
  field :location
  field :comment

end
