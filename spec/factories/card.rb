FactoryBot.defind do
    factory :card do
      title {Faker::Name.name}
    end
  end