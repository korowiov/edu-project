class CreateQuestionOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :question_options, id: :uuid do |t|
      t.references :question, type: :uuid
      t.string :content
      t.string :value_type, null: false
      t.string :value
      t.timestamps
    end
  end
end
