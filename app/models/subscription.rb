# frozen_string_literal: true

class Subscription < ApplicationRecord
  # relations
  belongs_to :parent
  belongs_to :option

  # callbacks
  after_save :create_movement

  def create_movement
    Movement.create(amount: option.price, subscription_id: id)
  end
end
