# frozen_string_literal: true

# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint
#  item_id    :bigint
#
# Indexes
#
#  index_line_items_on_cart_id  (cart_id)
#  index_line_items_on_item_id  (item_id)
#

class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
end
