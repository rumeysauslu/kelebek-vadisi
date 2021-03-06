class CreateParents < ActiveRecord::Migration[5.2]
  def change
    create_table :parents do |t|
      t.string :name
      t.string :phone
      t.date :birth
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
