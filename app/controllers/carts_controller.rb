# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show]

  def show
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find_by(user_id: current_user)
    @item = Item.find(params[:id])
    @cart.items << @item

    redirect_to cart_path(@cart)
  end

  def destroy
    @cart = Cart.find_by(user_id: current_user)
    item = Item.find(params[:id])
    @cart.items.delete(item)

    redirect_to cart_path(@cart)
  end

  private

  def correct_user
    cart = Cart.find(params[:id])
    redirect_to root_path unless current_user == cart.user
  end
end
