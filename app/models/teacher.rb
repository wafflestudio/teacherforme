#coding: utf-8
class Teacher
  include Mongoid::Document
  include Mongoid::Timestamps

  YEAR_HASH = {"ele" => "초등", "mid1" => "중1", "mid2" => "중2", "mid3" => "중3", "high1" => "고1", "high2" => "고2", "high3" => "고3", "general" => "일반"}
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
  field :location
  field :comment

  belongs_to :university
  belongs_to :user
  has_many :replies, as: :receivable

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
    res = ""
    if self.year
      self.year.each do |y|
        res << YEAR_HASH[y]+","
      end
    end
    res
  end
end
