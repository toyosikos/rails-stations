FactoryBot.define do
  factory :movie do
    association :screen, factory: :screen
    association :theater, factory: :theater
    sequence(:name) { |n| "TEST_MOVIE#{n}"}
    sequence(:year) { 2021 }
    sequence(:description) { "この映画は最高です。改行しました"}
    sequence(:image_url) { |n| "https://techbowl.co.jp/_nuxt/img/#{n}.png" }
    sequence(:is_showing) { 1 }
  end
end