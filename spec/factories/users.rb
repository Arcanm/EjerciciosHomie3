FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    name { FFaker::NameMX.name }
    last_name { FFaker::NameMX.last_name }
    mobile_phone { FFaker::PhoneNumberMX.international_home_work_phone_number}
    work_place { FFaker::Company.name }
  end
end