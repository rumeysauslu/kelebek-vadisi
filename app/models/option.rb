# frozen_string_literal: true

class Option < ApplicationRecord
  # relations
  belongs_to :package
  has_many :subscriptions, dependent: :destroy
  has_many :parents, through: :subscriptions

  # callbacks
  before_save :set_name

  def set_name
    self.name = "#{self.package.len} #{self.package.period} - #{self.child_size} Çocuk"
  end
end
