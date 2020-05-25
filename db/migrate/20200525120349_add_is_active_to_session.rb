class AddIsActiveToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :is_active, :boolean, default: false
  end
end
