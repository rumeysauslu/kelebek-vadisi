class CreateSurveyResults < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_results do |t|
      t.string :answers
      t.integer :options
      t.references :survey, foreign_key: true
      t.references :parent, foreign_key: true

      t.timestamps
    end
  end
end
