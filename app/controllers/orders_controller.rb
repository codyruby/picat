# frozen_string_literal: true

class OrdersController < ApplicationController
  def index; end

  def show; end

  def create
    @amount = current_user.cart.total_price
    @order = Order.create(user_id: current_user.id, amount: @amount)

    current_user.cart.line_items.each do |line_item|
      OrderItem.create(order_id: @order.id, item_id: line_item.item.id, quantity: line_item.quantity)
    end

    if @order.save
      empty_cart
      redirect_to root_path
    else
      redirect_to cart_path(current_user.cart)
    end
  end

  private

  def empty_cart
    current_user.cart.line_items.each(&:destroy)
  end
end
