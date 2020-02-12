namespace :listing do
  desc 'find_or_create_by! two home registers'
  task create_listings: :environment do
    listing_provider = ListingProvider.find_or_create_by!(name: 'mercado_libre')
    home1 = Home.find_or_create_by!(title: 'Nuevo depa1', price: 12_000)
    home2 = Home.find_or_create_by!(title: 'Nuevo depa2', price: 13_000)
    home3 = Home.find_or_create_by!(title: 'Nuevo depa3', price: 14_000)
    home4 = Home.find_or_create_by!(title: 'Nuevo depa4', price: 15_000)
    home5 = Home.find_or_create_by!(title: 'Nuevo depa5', price: 16_000)
    home6 = Home.find_or_create_by!(title: 'Nuevo depa6', price: 17_000)
    home7 = Home.find_or_create_by!(title: 'Nuevo depa7', price: 18_000)
    home8 = Home.find_or_create_by!(title: 'Nuevo depa8', price: 19_000)
    home9 = Home.find_or_create_by!(title: 'Nuevo depa9', price: 20_000)
    home10 = Home.find_or_create_by!(title: 'Nuevo depa10', price: 21_000)

    publish1_xml = {
      title: home1.title,
      listing_type_id: :silver,
      price: home1.price
    }.to_s

    publish5_xml = {
      title: home5.title,
      listing_type_id: :gold_premium,
      price: home5.price
    }.to_s

    publish7_xml = {
      title: home7.title,
      listing_type_id: :gold,
      price: home7.price
    }.to_s

    publish8_xml = {
      title: home8.title,
      listing_type_id: :gold,
      price: home8.price
    }.to_s

    publish10_xml = {
      title: home10.title,
      listing_type_id: :gold_premium,
      price: home10.price
    }.to_s

    publish2_xml = {
      title: home2.title,
      listing_type_id: :gold,
      price: home2.price
    }.to_s

    publish3_xml = {
      title: home3.title,
      listing_type_id: :silver,
      price: home3.price
    }.to_s

    Home::Listing.find_or_create_by!(home: home1, publish_xml_or_response: publish1_xml, listing_name: 'mercado_libre')
    Home::Listing.find_or_create_by!(home: home5, publish_xml_or_response: publish5_xml, listing_name: 'mercado_libre')
    Home::Listing.find_or_create_by!(home: home7, publish_xml_or_response: publish7_xml, listing_name: 'mercado_libre')
    Home::Listing.find_or_create_by!(home: home8, publish_xml_or_response: publish8_xml, listing_name: 'mercado_libre')
    Home::Listing.find_or_create_by!(home: home10, publish_xml_or_response: publish10_xml, listing_name: 'amazon')
    Home::Listing.find_or_create_by!(home: home2, publish_xml_or_response: publish2_xml, listing_name: 'mercado_libre')
    Home::Listing.find_or_create_by!(home: home3, publish_xml_or_response: publish3_xml, listing_name: 'mercado_libre')

    Home::Listing::Outstanding.find_or_create_by!(home: home3, listing_provider: listing_provider, outstanding_type: :gold)
    Home::Listing::Outstanding.find_or_create_by!(home: home4, listing_provider: listing_provider, outstanding_type: :gold_premium)
    Home::Listing::Outstanding.find_or_create_by!(home: home5, listing_provider: listing_provider, outstanding_type: :gold)
    Home::Listing::Outstanding.find_or_create_by!(home: home7, listing_provider: listing_provider, outstanding_type: :gold_premium)
    Home::Listing::Outstanding.find_or_create_by!(home: home6, listing_provider: listing_provider, outstanding_type: :gold_premium)
    Home::Listing::Outstanding.find_or_create_by!(home: home10, listing_provider: listing_provider, outstanding_type: :gold)
    Home::Listing::Outstanding.find_or_create_by!(home: home9, listing_provider: listing_provider, outstanding_type: :gold)
  end
end