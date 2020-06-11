# frozen_string_literal: true

class Slide < ApplicationRecord
  # mountes
  mount_uploader :image, SlideUploader

  # validations
  validates :title, presence: true
  validates :image, presence: true

  # scopes
  scope :active, -> {where(is_active: true)}
end
