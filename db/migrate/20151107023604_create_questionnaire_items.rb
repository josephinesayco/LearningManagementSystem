class CreateQuestionnaireItems < ActiveRecord::Migration
  def change
    create_table :questionnaire_items do |t|
      t.string :item
      t.boolean :is_answer, default: false
      t.integer :questionnaire_id

      t.timestamps null: false
    end
  end
end
