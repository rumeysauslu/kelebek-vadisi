# frozen_string_literal: true

class Option < ApplicationRecord
  # relations
  belongs_to :package
  has_many :subscriptions, dependent: :destroy
  has_many :parents, through: :subscriptions
end
