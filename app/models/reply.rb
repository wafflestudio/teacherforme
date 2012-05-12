class Reply
  include Mongoid::Document
  include Mongoid::Timestamps

  field :comment, type: String

  belongs_to :user  # sender

  # receiver
  belongs_to :receivable, polymorphic: true

end
