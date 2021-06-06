class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions, id: :uuid do |t|
      t.references :questionable, polymorphic: true, type: :uuid
      t.string :question_type, null: false, index: true
      t.string :option_value_type, null: false
      t.text :content
      t.timestamps
    end
  end
end
