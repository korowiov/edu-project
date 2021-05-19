class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name, null: false, unique: true
      t.string :slug, index: true, unique: true
      t.bigint :parent_id, index: true
      t.timestamps
    end
  end
end
