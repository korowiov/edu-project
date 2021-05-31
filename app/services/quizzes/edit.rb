module Quizzes
  class Edit < Patterns::Action
    set_form_klass QuizForm
    set_model_klass Quiz
  end
end