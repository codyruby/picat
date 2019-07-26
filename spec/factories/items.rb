# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    title { "MyString" }
    description { "MyText" }
    price { "9.99" }
    image_url { "MyString" }
  end
end
