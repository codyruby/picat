# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :bigint
#  order_id   :bigint
#
# Indexes
#
#  index_order_items_on_item_id   (item_id)
#  index_order_items_on_order_id  (order_id)
#

FactoryBot.define do
  factory :order_item do
    quantity { 1 }
  end
end
