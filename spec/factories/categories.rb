FactoryBot.define do
  factory :category do
    name { ['Comics', 'Figures', 'Posters', 'Stickers', 'Bottles', 'Pictures'].sample }
  end
end
