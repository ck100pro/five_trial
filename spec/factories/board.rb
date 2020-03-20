require 'faker'

FactoryBot.define do
  factory :board do
    title {Faker::Name.name}
  end
end