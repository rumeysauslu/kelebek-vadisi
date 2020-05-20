# frozen_string_literal: true

class Parent < ApplicationRecord
  # relations
  belongs_to :user
  has_many :children

  # validations
  validates :name, presence: true
  validates :phone, presence: true
  validates :birth, presence: true
  validates :user_id, uniqueness: true

  # nested attributes
  accepts_nested_attributes_for :children, allow_destroy: true
  accepts_nested_attributes_for :user
end
