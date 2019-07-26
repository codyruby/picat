# frozen_string_literal: true

class Item < ApplicationRecord
  validates :title, presence: true, length: { in: 4..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0
            }
  validates :image_url, presence: true
end
