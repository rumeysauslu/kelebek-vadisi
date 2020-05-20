# frozen_string_literal: true

module Admin
  class ChildrenController < AdminController
    before_action :set_child, only: %i[edit update destroy]
    def index
      @children = Child.order(id: :desc)
    end

    def edit;end

    def update
      @child.update ? redirect_to(admin_children_path, notice: 'Çocuk bilgileri güncellendi') : render(:edit)
    end

    def destroy
      @child.destroy ? redirect_to(admin_children_path, notice: 'Çocuk kaydı silindi') : redirect_to(admin_children_path, alert: 'Çocuk kaydı silinemedi')
    end

    private

    def set_child
      @child = Child.find(params[:id])
    end

    def child_params
      params.require(:child).permit(:name, :birth, :parent_id)
    end
  end
end