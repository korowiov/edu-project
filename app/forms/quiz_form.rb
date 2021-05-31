class QuizForm < Patterns::Form
  model Quiz

  properties :name,
             :description,
             :education_level_id,
             :subject_ids
end
