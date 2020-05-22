# frozen_string_literal: true

module Admin
  class MovementsController < AdminController
    def index
      @movements = Movement.order(id: :desc)
    end
  end
end
