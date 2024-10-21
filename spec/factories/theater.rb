FactoryBot.define do
    factory :theater do
      sequence(:name) { |n| "イオンシネマ#{n}" }
    end
  end