# frozen_string_literal: true

class Package < ApplicationRecord
  TYPES = %i[standard subscriptions].freeze
  PERIODS = %i[minutes month].freeze

  # enums
  enum p_type: TYPES
  enum period: PERIODS
end
