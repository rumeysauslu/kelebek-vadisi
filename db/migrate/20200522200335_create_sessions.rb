class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :child, foreign_key: true
      t.datetime :checkin_time
      t.datetime :checkout_time

      t.timestamps
    end
  end
end
