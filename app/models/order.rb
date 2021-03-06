# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  after_create :send_order_to_user
  after_create :send_order_to_admin

  def send_order_to_user
    UserMailer.order_confirmation(self).deliver_now
  end

  def send_order_to_admin
    UserMailer.order_confirmation_to_admin(self).deliver_now
  end
end
