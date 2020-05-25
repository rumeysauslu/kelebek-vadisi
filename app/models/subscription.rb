# frozen_string_literal: true

class Subscription < ApplicationRecord
  # relations
  belongs_to :child
  belongs_to :option

  # callbacks
  after_save :create_movement
  before_save :set_end_time
  after_save :set_session

  # scopes
  scope :active, -> { where(is_active: true) }

  def create_movement
    Movement.create(amount: option.price, subscription_id: id)
  end

  def set_session
    Session.create(child_id: child.id, is_active: true, checkin_time: created_at, checkout_time: created_at+(option.package.len.minutes)) if self.option.package.standard? 
  end

  def set_end_time
    len = option.package.len
    time = Time.zone.now
    option.package.month? ? (self.end_time = time + len.month) : (self.end_time = time + len.minutes)
  end
end
