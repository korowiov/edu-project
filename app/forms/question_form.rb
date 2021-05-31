class QuestionForm < Patterns::Form
  model Question

  properties :name,
             :content,
             :question_type,
             :questionable

  collection :question_options, populate_if_empty: QuestionOption do
    properties :id, :content, :value, :value_type
  end
end
