class Student
  include Mongoid::Document
  include Mongoid::Timestamps

  field :pay, type: Integer
  field :subject
  field :sex
  field :phone
  field :email


end
