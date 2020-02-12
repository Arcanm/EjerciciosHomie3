namespace :home do
  desc "Create two home registers"
  task create_homes: :environment do

    user = User.find_or_create_by!(
      email: 'pelinbb@ily.com',
      name: 'Andres',
      last_name: 'Arias',
      mobile_phone: '9331075176',
      work_place: 'mesera'
    )
    owner = Owner.find_or_create_by!(curp: 'AICA960216HDFFRRN04', registered_in_srpago: true, user: user)

    Home.create(
      price: 4500.99,
      extra_service: 50.80,
      home_features: { garden: false, furnished: true, gym: true },
      home_master_id: nil,
      location: [-333.333, 333.333],
      owner: owner
    )
  end
end