# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def order_confirmation(order)
    @order = order
    @line_items = @order.user.cart.line_items
    @url = 'http://monsite.fr/login'

    mail(to: @order.user.email, subject: 'Picat order confirmation !')
  end
end
