# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) do
    FactoryBot.create(:user)
  end

  context "when associations" do
    describe "orders" do
      it { is_expected.to belong_to(:user) }
      it { is_expected.to have_many(:items) }
    end
  end
end
