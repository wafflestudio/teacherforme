class Reply
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :phone, type: String
  field :email, type: String

end
