class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :parent, foreign_key: true
      t.references :option, foreign_key: true

      t.timestamps
    end
  end
end
