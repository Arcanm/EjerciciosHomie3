class Home::Listing
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  field :publish_xml_or_response, type: String
  field :listing_name, type: String

  belongs_to :home, index: true
end