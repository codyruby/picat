# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show]

  def show
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find_by(user: current_user)
    @item = Item.find(params[:id])

    add_quantity(@item)
  end

  def destroy
    @cart = Cart.find_by(user: current_user)
    @item = Item.find(params[:id])

    sub_quantity(@item)
  end

  private

  def correct_user
    cart = Cart.find(params[:id])
    redirect_to root_path unless current_user == cart.user
  end

  def add_quantity(item)
    if @cart.items.include?(item)
      select_line = @cart.line_items.where(item: item)
      select_line.first.quantity += 1
      select_line.first.save
    else
      @cart.items << @item
    end

    redirect_to cart_path(@cart)
  end

  def sub_quantity(item)
    if @cart.line_items.where(item: item).first.quantity > 1
      select_line = @cart.line_items.where(item: item)
      select_line.first.quantity -= 1
      select_line.first.save
    else
      @cart.items.delete(item)
    end

    redirect_to cart_path(@cart)
  end
end
