# frozen_string_literal: true

module Admin
  class SlidesController < AdminController
    before_action :set_slide, only: %i[edit update destroy]
    def index
      @slides = Slide.all.order(created_at: :desc)
    end

    def new
      @slide = Slide.new
    end

    def create
      @slide = Slide.new(slide_params)
      @slide.save ? redirect_to(admin_slides_path, notice: 'Yeni slayt eklendi') : render(:new)
    end

    def edit;end

    def update
      @slide.update(slide_params) ? redirect_to(admin_slides_path, notice: 'Slayt güncellendi') : render(:edit)
    end

    def destroy
      @slide.destroy ? redirect_to(admin_slides_path, notice: 'Slayt silindi') : redirect_to(admin_slides_path, notice: 'Slayt silinemedi')
    end

    def set_active
      @slide = Slide.find(params[:slide_id])
      @slide.update(is_active: !@slide.is_active)
    end

    private

    def set_slide
      @slide = Slide.find(params[:id])
    end

    def slide_params
      params.require(:slide).permit(:title, :image, :is_active, :sequence, :detail)
    end
  end
end

