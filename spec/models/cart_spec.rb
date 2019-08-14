# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:user) do
    FactoryBot.create(:user)
  end

  context "when associations" do
    describe "carts" do
      it { expect(user).to have_one(:cart) }
      it { is_expected.to belong_to(:user) }
      it { is_expected.to have_many(:items) }
    end
  end
end
