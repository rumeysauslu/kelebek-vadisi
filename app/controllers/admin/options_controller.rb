# frozen_string_literal: true

module Admin
  class OptionsController < AdminController
    before_action :set_option, only: %i[edit update destroy]
    def index
      @options = Option.order(child_size: :asc)
    end

    def destroy
      @option.destroy ? redirect_to(admin_options_path, notice: 'Seçenek silindi') : redirect_to(admin_options_path, alert: 'Seçenek silinemedi')
    end

    private

    def set_option
      @option = Option.find(params[:id])
    end

    def option_params
      params.require(:option).permit(:name, :birth, :parent_id)
    end
  end
end
