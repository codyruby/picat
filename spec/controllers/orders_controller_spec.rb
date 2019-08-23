# frozen_string_literal: true

require 'rails_helper'
require 'stripe_mock'

RSpec.describe OrdersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:order) { user.orders }
  let!(:item) { create(:item) }
  let!(:cart) { user.cart }

  describe "GET #index" do
    it "gets index" do
      sign_in user
      get :index

      response.should be_success
    end
  end

  describe "GET show" do
    subject { get :show, params: { id: order.ids } }

    it "renders the show template" do
      sign_in user

      expect(subject).to render_template("show")
    end
  end

  # describe "POST create" do
  #   #   it "redirects to after new order" do
  #   #     sign_in user
  #   #     post :create, params: { user_id: user, amount: 9.99 }

  #   #     response.should redirect_to root_path
  #   #   end
  #   let(:stripe_helper) { StripeMock.create_test_helper }

  #   before { StripeMock.start }

  #   after { StripeMock.stop }

  #   it "creates a stripe customer" do
  #     # This doesn't touch stripe's servers nor the internet!
  #     # Specify :source in place of :card (with same value) to return customer with source data
  #     customer = Stripe::Customer.create(
  #       email: 'johnny@appleseed.com',
  #       card: stripe_helper.generate_card_token
  #     )
  #     expect(customer.email).to eq('johnny@appleseed.com')
  #   end
  # end

  # it "creates a new order" do
  #   customer = Stripe::Customer.create({
  #     email: 'johnny@appleseed.com',
  #     card: stripe_helper.generate_card_token
  #   })

  #   sign_in user
  #   @amount = 99.0
  #   post :create, params: { user_id: user, amount: 99.0 }

  #   expect(Order.count).to eq(1)

  # end

  # context "with invalid attributes" do
  #   it "doest not create a new order" do
  #     sign_in user
  #     cart = Cart.create(user_id: user)
  #     expect {
  #       post :create, params: { }

  #     }.to_not change(Order, :count)
  #   end

  #   it "redirect_to cart_path after not created" do
  #     sign_in user
  #     cart = Cart.create(user_id: user)
  #     post :create, params: { user_id: "invalid" }
  #     expect(cart_path(user.cart)).to redirect_to cart_path(user.cart)
  #   end
  #  end
end
