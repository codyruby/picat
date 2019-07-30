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

  let(:item) do
    FactoryBot.create(:item)
  end

  it "has a valid factory" do
    expect(build(:item)).to be_valid
  end

  context "when validation" do
    it "is valid with valid attributes" do
      expect(item).to be_a(described_class)
    end

    describe "#title" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_length_of(:title).is_at_least(4) }
      it { is_expected.to validate_length_of(:title).is_at_most(140) }
      it { is_expected.to allow_value(Faker::Lorem.characters(50)).for(:title) }
      it { is_expected.not_to allow_value(Faker::Lorem.characters(3)).for(:title) }
    end

    describe "#description" do
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_length_of(:description).is_at_least(20) }
      it { is_expected.to validate_length_of(:description).is_at_most(1000) }
      it { is_expected.to allow_value(Faker::Lorem.characters(500)).for(:description) }
      it { is_expected.not_to allow_value(Faker::Lorem.characters(3)).for(:description) }
    end

    describe "#price" do
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
      it { is_expected.not_to allow_value(Faker::Number.negative).for(:price) }
    end

    describe "#image_url" do
      it { is_expected.to validate_presence_of(:image_url) }
    end
  end
end
