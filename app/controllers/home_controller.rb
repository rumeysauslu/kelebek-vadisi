# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @slides = Slide.active.order(sequence: :desc)
  end
end
