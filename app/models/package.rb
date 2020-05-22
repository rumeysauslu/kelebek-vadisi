# frozen_string_literal: true

class Package < ApplicationRecord
  TYPES = %i[standard monthly].freeze
  PERIODS = %i[minute month].freeze

  # relations
  has_many :options

  # nested attributes
  accepts_nested_attributes_for :options

  # enums
  enum p_type: TYPES
  enum period: PERIODS
end
