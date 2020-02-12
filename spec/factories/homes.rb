FactoryBot.define do
  factory :home do
    owner { FactoryBot.create(:owner) }
    price { Faker::Number.decimal(l_digits: 6, r_digits: 2) }
    extra_service { Faker::Number.decimal(l_digits: 6, r_digits: 2) }
    home_features do
    { 
      garden: FFaker::Boolean.random,
      furnished: FFaker::Boolean.random,
      gym: FFaker::Boolean.random
    }
    end
  end
end