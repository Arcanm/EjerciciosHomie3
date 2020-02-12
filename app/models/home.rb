class Home
  include Mongoid::Document
  include Mongoid::Enum

  before_validation :set_total_amount

  field :price, type: Float
  field :extra_service, type: Float
  field :total_amount, type: Float
  field :home_features, type: Hash, default: { garden: false, furnished: false, gym: false }
  field :location, type: Array
  field :home_master_id, type: String
  enum :status, [:published, :in_progress, :rented]

  validates :price, :extra_service, :total_amount, :home_features, :status, presence: true

  belongs_to :owner
  has_many :rents

  private

  def set_total_amount
    self.total_amount = price + extra_service
  end
end