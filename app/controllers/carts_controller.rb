# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find_by(user_id: current_user)
    @item = Item.find(params[:id])
    @cart.items << @item

    redirect_to cart_path(@cart)
  end
end
