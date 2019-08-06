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

require 'rails_helper'

RSpec.describe LineItem, type: :model do
  context "when associations" do
    describe "line_items" do
      it { is_expected.to belong_to(:cart) }
      it { is_expected.to belong_to(:item) }
    end
  end
end
