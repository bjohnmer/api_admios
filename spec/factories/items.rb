FactoryBot.define do
  factory :item do
    name  { Faker::Lorem.words(rand(1...4)) }
    description { Faker::Lorem.sentence(rand(1...4)) }
    aquisition_date { Date.parse(rand(1.year.ago..Time.now).to_s) }

    factory :item_no_valid_aquisition_date do
      aquisition_date { 'string' }
    end
    category { create(:category) }
  end
end
