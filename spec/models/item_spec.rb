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

require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @item = FactoryBot.create(:item)
  end

  it "has a valid factory" do
    expect(build(:item)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@item).to be_a(described_class)
    end

    describe "#title" do
      it { expect(@item).to validate_presence_of(:title) }
    end

    describe "#description" do
      it { expect(@item).to validate_presence_of(:description) }
    end

    describe "#price" do
      it { expect(@item).to validate_length_of(:price) }
    end

    describe "#image_url" do
      it { expect(@item).to validate_length_of(:image_url) }
    end
  end
end
