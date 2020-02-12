class User
  include Mongoid::Document

  field :email, type: String
  field :name, type: String
  field :last_name, type: String
  field :mobile_phone, type: String
  field :work_place, type: String
  
  has_many :rents

  validates :email, :name, :last_name, :mobile_phone, :work_place, presence: true
end