class AddEndTimeToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :end_time, :datetime
  end
end
