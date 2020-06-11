class CreateSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|
      t.string :title
      t.string :image
      t.boolean :is_active, default: false
      t.integer :sequence, default: 0
      t.string :detail

      t.timestamps
    end
  end
end
