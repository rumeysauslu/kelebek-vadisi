# frozen_string_literal: true

class Survey < ApplicationRecord
  # relations
  has_many :survey_results, dependent: :destroy
end
