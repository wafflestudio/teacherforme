class Teacher
  include Mongoid::Document
  include Mongoid::Timestamps

  field :pay, type: String
  field :sex, type: Boolean
  field :subject, type: String
  field :phone, type: String
  field :year, type: String
  field :location, type: String
  field :email, type: String

  belongs_to :university
end
