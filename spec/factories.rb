FactoryBot.define do

  factory :campaign do
    sequence(:title) { |n| "Campaign #{n}" }
    description "bar"
  end

  factory :goody do
    sequence(:title) { |n| "Goody #{n}" }
    campaign
  end

  factory :supporter do
    sequence(:first_name) { |n| "John, the #{n}" }
    last_name  "Doe"
    date_of_birth { 18.years.ago }
  end
end
