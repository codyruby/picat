# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  subject { get :show, params: { id: cart.id } }

  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:cart) { user.cart }
  let!(:item) { create(:item) }

  ############################ SHOW ###############################

  describe "GET show" do
    it "assigns @carts" do
      sign_in user
      subject

      expect(assigns(:cart)).to eq(cart)
    end

    it "renders the show template" do
      sign_in user

      expect(subject).to render_template("show")
    end

    describe "GET cart#show as a visitor not logged in " do
      it "get a 401 redirection if visitor is not logged in" do
        subject
        expect(response).to have_http_status(:found)
      end

      it "redirect user to devise sign in" do
        subject
        expect(response).to redirect_to("http://test.host/users/sign_in")
      end
    end

    describe "GET cart#show with the wrong customer " do
      it "get a 302 redirection if visitor is not logged in" do
        sign_in user
        get :show, params: { id: user2.cart }
        expect(response).to redirect_to("http://test.host/")
      end
    end
  end

  ############################ UPDATE ##############################

  describe "PUT update" do
    it "after update new item to cart" do
      sign_in user
      put :update, params: { id: item.id }

      expect(user.cart.items).to include(item)
    end

    it "redirects to the updated cart" do
      sign_in user
      put :update, params: { id: item.id }

      expect(subject).to render_template("show")
    end

    # it "add quantity to line_item" do
    #     sign_in user

    #     put :update, params: { id: item.id }

    #     expect(response).to change(cart.line_items.first, :quantity).by(1)
    # end
  end
end
