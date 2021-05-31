module Quizzes
  class Create < Patterns::Action
    set_form_klass QuizForm
    set_model_klass Quiz
  end
end
