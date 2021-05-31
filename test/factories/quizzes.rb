FactoryBot.define do
  factory :quiz do
    sequence(:name) { |n| %(quiz name #{n}) }
    sequence(:description) { |n| %(quiz description #{n}) }
    education_level { create(:education_level) }
    subjects { [create(:subject)] }
  end
end
