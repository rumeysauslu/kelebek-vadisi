class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.references :package, foreign_key: true
      t.integer :child_size, default: 1
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
