# frozen_string_literal: true

class Subscription < ApplicationRecord
  # relations
  belongs_to :parent
  belongs_to :option

end
