require_relative 'base_test'

module FormsTests
  module QuestionsTests
    module CreateTests
      class SingleAnswerTest < BaseTest
        def valid_params
          {
            content: 'test question',
            question_type: 'single_answer',
            question_options_attributes: [
              {
                content: 'test option',
                value_type: 'integer',
                value: 1
              }
            ]
          }
        end

        test 'validate valid params' do
          form = QuestionForm.new(Question.new)
          assert form.validate(valid_params)
        end
      end
    end
  end
end
