class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :body
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
