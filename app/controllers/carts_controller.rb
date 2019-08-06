# frozen_string_literal: true

class CartsController < ApplicationController
  def show; end

  def create
    @cart = Cart.new(cart_params)
    @cart.user_id = current_user.id
    @cart.save
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
