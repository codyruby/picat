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

class Item < ApplicationRecord
  validates :title, presence: true, length: { in: 4..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0
            }

  has_many :line_items, dependent: :destroy
  has_many :carts, through: :line_items

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  has_one_attached :picture, dependent: :destroy
end
