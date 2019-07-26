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
    title { "MyString" }
    description { "MyText" }
    price { "9.99" }
    image_url { "MyString" }
  end
end
