# frozen_string_literal: true

module Admin
  class PackagesController < AdminController
    before_action :set_package, only: %i[edit update destroy]
    def index
      @packages = Package.order(id: :desc)
    end

    def new
      @package = Package.new
    end

    def create
      @package = Package.new(package_params)
      @package.save ? redirect_to(admin_packages_path, notice: 'Yeni Paket Oluşturuldu') : render(:new)
    end

    def edit;end

    def update
      @package.update(package_params) ? redirect_to(admin_packages_path, notice: 'Paket Güncellendi') : render(:edit)
    end

    def destroy
      @package.destroy ? redirect_to(admin_packages_path, notice: 'Paket Silindi') : redirect_to(admin_packages_path, alert: 'Paket Silinemedi')
    end

    private

    def set_package
      @package = Package.find(params[:id])
    end

    def package_params
      params.require(:package).permit(
        :p_type, :name, :period, :len,
        options_attributes: Option.attribute_names.map(&:to_sym).push(:_destroy))
    end
  end
end
