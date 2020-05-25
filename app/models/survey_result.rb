# frozen_string_literal: true

class SurveyResult < ApplicationRecord
  OPTIONS = %i[very_good good medium bad very_bad]

  # relations
  belongs_to :survey
  belongs_to :parent

  # enums
  enum options: OPTIONS
end
