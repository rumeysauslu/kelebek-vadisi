# frozen_string_literal: true

module Admin
  class ParentsController < AdminController
    before_action :set_parent, only: %i[edit update destroy]
    def index
      @parents = Parent.all.order(id: :desc)
    end

    def new
      @parent = Parent.new
    end

    def create
      @parent = Parent.new(parent_params)
      @parent.user = User.new(email: "#{@parent.phone}@kelebek.vadisi", phone: @parent.phone, password: [*('A'..'Z'),*('0'..'9')].shuffle[0,8].join)
      pry
      @parent.save ? redirect_to(admin_parents_path, notice: 'Yeni veli oluşturuldu') : render(:new)
    end

    def edit;end

    def update
      @parent.update(parent_params) ? redirect_to(admin_parents_path, notice: 'Veli güncellendi') : render(:edit)
    end

    def destroy
      @parent.destroy ? redirect_to(admin_parents_path, notice: 'Veli silindi') : redirect_to(admin_parents_path, alert: 'Veli silinemedi')
    end

    private

    def set_parent
      @parent = Parent.find(params[:id])
    end

    def parent_params
      params.require(:parent).permit(
        :name, :phone, :birth, :user_id, :option_ids,
        children_attributes: Child.attribute_names.map(&:to_sym).push(:_destroy)
      )
    end
  end
end
