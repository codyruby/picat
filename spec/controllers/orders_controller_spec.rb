# frozen_string_literal: true

# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe OrdersController, type: :controller do
#   let!(:user) { create(:user) }
#   let!(:order) { user.orders }
#   let!(:item) { create(:item) }
#   let!(:cart) { user.cart }

#   describe "GET #index" do
#     it "gets index" do
#       get :index
#       sign_in user
#       response.should be_success
#     end
#   end

#   describe "GET show" do
#     subject { get :show, params: { id: order.ids } }

#     it "renders the show template" do
#       expect(subject).to render_template("show")
#     end
#   end

#   describe "POST create" do
#     context "with valid attributes" do
#       it "creates a new order" do
#         sign_in user
#         post :create, params: { user_id: user, amount: 9.99 }

#         expect(Order.count).to eq(1)
#       end

#       it "redirects to after new order" do
#         sign_in user
#         post :create, params: { user_id: user, amount: 9.99 }

#         response.should redirect_to root_path
#       end
#     end

#     # context "with invalid attributes" do
#     #   it "doest not create a new order" do
#     #     sign_in user
#     #     cart = Cart.create(user_id: user)
#     #     expect {
#     #       post :create, params: { }

#     #     }.to_not change(Order, :count)
#     #   end

#     #   it "redirect_to cart_path after not created" do
#     #     sign_in user
#     #     cart = Cart.create(user_id: user)
#     #     post :create, params: { user_id: "invalid" }
#     #     expect(cart_path(user.cart)).to redirect_to cart_path(user.cart)
#     #   end
#     #  end
#   end
# end
