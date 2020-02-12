class Home
  include Mongoid::Document
  include Mongoid::Enum

  field :price, type: Float
  field :title, type: String

  validates :price, :title, presence: true

end