# frozen_string_literal: true

module Admin
  class SubscriptionsController < AdminController
    before_action :set_subscription, only: %i[edit update destroy]
    def index
      @subscriptions = Subscription.order(id: :desc)
    end

    def new
      @subscription = Subscription.new
      @parent = Parent.find(params[:parent_id])
    end

    def create
      @subscription = Subscription.new(subscription_params)
      @subscription.parent = Parent.find(params[:parent_id])
      @subscription.save ? redirect_to(admin_subscriptions_path, notice: 'Yeni Abonelik Oluşturuldu') : render(:new)
    end

    def edit;end

    def update
    end

    def destroy
    end

    private

    def set_subscription
    end

    def subscription_params
      params.require(:subscription).permit(:option_id, :parent_id)
    end
  end
end
