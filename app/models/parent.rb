# frozen_string_literal: true

class Parent < ApplicationRecord
  # relations
  belongs_to :user
  has_many :children
  has_many :subscriptions, dependent: :destroy
  has_many :options, through: :subscriptions

  # validations
  validates :name, presence: true
  validates :phone, presence: true
  validates :birth, presence: true

  # nested attributes
  accepts_nested_attributes_for :children, allow_destroy: true
  accepts_nested_attributes_for :user
end
