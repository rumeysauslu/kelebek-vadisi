class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :question
      t.integer :sequence, default: 1

      t.timestamps
    end
  end
end
