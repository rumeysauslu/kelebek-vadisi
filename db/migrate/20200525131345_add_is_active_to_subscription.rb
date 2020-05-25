class AddIsActiveToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :is_active, :boolean, default: false
  end
end
