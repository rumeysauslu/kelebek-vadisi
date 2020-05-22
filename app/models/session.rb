# frozen_string_literal: true

class Session < ApplicationRecord
  # relations
  belongs_to :child
end
