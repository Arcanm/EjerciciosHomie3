class Owner
  include Mongoid::Document
  
  field :curp, type: String
  field :registered_in_srpago, type: Boolean

  has_many :homes
  belongs_to :user
  
  validates :curp, :registered_in_srpago, presence: true
end
