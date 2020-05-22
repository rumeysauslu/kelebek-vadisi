# frozen_string_literal: true

class Child < ApplicationRecord
  # relations
  belongs_to :parent
  has_many :subscriptions, dependent: :destroy
  has_many :options, through: :subscriptions
  has_many :packages, through: :options
  has_many :sessions, dependent: :destroy
end
