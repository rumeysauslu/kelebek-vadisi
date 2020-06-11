# frozen_string_literal: true

class Announcement < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  # scopes
  scope :active, ->{where(is_active: true)}
end
