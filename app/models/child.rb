# frozen_string_literal: true

class Child < ApplicationRecord
  # relations
  belongs_to :parent
  has_many :subscriptions, dependent: :destroy
  has_many :options, through: :subscriptions
end
