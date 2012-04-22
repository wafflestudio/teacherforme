class University
  include Mongoid::Document

  field :name, type: String

  has_many :teachers
end
