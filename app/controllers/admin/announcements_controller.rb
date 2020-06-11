# frozen_string_literal: true

module Admin
  class AnnouncementsController < AdminController
    before_action :set_announcement, only: %i[edit update destroy]
    def index
      @announcements = Announcement.all.order(created_at: :desc)
    end

    def new
      @announcement = Announcement.new
    end

    def create
      @announcement = Announcement.new(announcement_params)
      @announcement.save ? redirect_to(admin_announcements_path, notice: 'Yeni duyuru eklendi') : render(:new)
    end

    def edit;end

    def update
      @announcement.update(announcement_params) ? redirect_to(admin_announcements_path, notice: 'Duyuru güncellendi') : render(:edit)
    end

    def destroy
      @announcement.destroy ? redirect_to(admin_announcements_path, notice: 'Duyuru silindi') : redirect_to(admin_announcements_path, notice: 'Duyuru silinemedi')
    end

    def set_active
      @announcement = Announcement.find(params[:announcement_id])
      @announcement.update(is_active: !@announcement.is_active)
    end

    private

    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(:title, :body, :is_active)
    end
  end
end
