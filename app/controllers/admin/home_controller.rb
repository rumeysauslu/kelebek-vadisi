# frozen_string_literal: true

module Admin
  class HomeController < AdminController
    def index
      @amounts = Movement.all.sum(&:amount).to_d
    end
  end
end
