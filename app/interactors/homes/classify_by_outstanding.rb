class Homes::ClassifyByOutstanding
  include Interactor

  def call
    listings_list = filter_listings_by_status
    outstanding_list = filter_outstandings_by_status
    differences_listing = add_listings(listings_list, outstanding_list)
    differences_outstanding = add_outstandings(listings_list, outstanding_list)
    context.compared_homes = { listings: differences_listing, outstandings: differences_outstanding }
  end

  private

  def filter_listings_by_status
    listing_list = Home::Listing.where(listing_name: 'mercado_libre')
    listings_list = {}
    listing_list.each do |listing|
      listing_status = eval(listing.publish_xml_or_response)[:listing_type_id]
      listings_list[listing_status.to_sym] = [] unless listings_list[listing_status.to_sym]
      listings_list[listing_status.to_sym] << listing.home_id
    end
    listings_list
  end

  def filter_outstandings_by_status
    outstanding_list = {}
    outstandings = Home::Listing::Outstanding.all
    outstandings.each do |outstanding|
      next if outstanding.listing_provider.name != 'mercado_libre'

      outstanding_list[outstanding.outstanding_type.to_sym] = [] unless outstanding_list[outstanding.outstanding_type.to_sym]
      outstanding_list[outstanding.outstanding_type.to_sym] << outstanding.home_id
    end
    outstanding_list
  end

  def add_listings(listings_list, outstanding_list)
    differences_list = {}
    listings_list.each do |key, value|
      outstanding_list[key]? key_homes = value - outstanding_list[key] : key_homes = value
      differences_list = set_info(differences_list, key, key_homes)
    end
    differences_list
  end

  def set_info(differences_list, key, key_homes)
    differences_list[key] = { total_homes: 0, homes: [] }
    differences_list[key][:homes] = key_homes
    differences_list[key][:total_homes] += key_homes.length
    differences_list
  end

  def add_outstandings(listings_list, outstanding_list)
    differences_list = {}
    outstanding_list.each do |key, value|
      listings_list[key]? key_homes = value - listings_list[key] : key_homes = value
      differences_list = set_info(differences_list, key, key_homes)
    end
    differences_list
  end
end