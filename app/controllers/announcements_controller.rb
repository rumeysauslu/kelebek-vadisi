# frozen_string_literal: true

class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.active.order(created_at: :desc)
  end
end
