class Teacher
  include Mongoid::Document
  include Mongoid::Timestamps

  field :pay, type: String
  field :sex, type: Boolean
  field :subject, type: Array
end
