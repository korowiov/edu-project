class QuizForm < Patterns::Form
  model Quiz

  properties :name,
             :description,
             :education_level_id,
             :subject_ids

  validates :name, presence: true
  validates :description, presence: true
  validates :education_level_id, presence: true
  validates :subject_ids, presence: true
end
