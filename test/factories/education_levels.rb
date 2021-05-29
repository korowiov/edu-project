FactoryBot.define do
  factory :education_level do
    sequence(:name) { |n| %(education level #{n}) }
    sequence(:slug) { |n| %(education-level-#{n}) }
  end
end
