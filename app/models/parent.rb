# frozen_string_literal: true

class Parent < ApplicationRecord
  belongs_to :user

  # validations
  validates :name, presence: true
  validates :phone, presence: true
  validates :birth, presence: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: true
end
