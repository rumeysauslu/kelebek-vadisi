class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :p_type, default: 0
      t.integer :period, default: 0
      t.integer :len, default: 1

      t.timestamps
    end
  end
end
