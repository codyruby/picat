# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  description :text
#  image_url   :string
#  price       :decimal(, )
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :item do
    title { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    price { rand(10..100) }
    image_url { Faker::Avatar.image }
  end
end
