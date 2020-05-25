# frozen_string_literal: true

module Admin
  class SessionsController < AdminController
    def index
      @sessions = Session.all.active.order(id: :desc)
    end

    def start_session
      @session = Session.new(child_id: params[:child_id], checkin_time: Time.zone.now, checkout_time: Time.zone.now + 240.minutes, is_active: true)
      @session.save ? redirect_to(admin_sessions_path, notice: 'Oturum başlatıldı') : redirect_to(admin_sessions_path, alert: @session.errors.full_messages.join(', '))
    end
  end
end
