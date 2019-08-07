# frozen_string_literal: true

class LineItemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @cart = Cart.find_by(user_id: current_user.id)
    @line_item = @cart.line_items.create(item_id: params[:item_id])

    redirect_to cart_path(@cart.id)
  end
end
