require_relative 'base_test'

module FormsTests
  module QuestionsTests
    module CreateTests
      class SingleAnswerTest < BaseTest
        def valid_params
          {
            'content' => 'test question',
            'question_type' => 'single_answer',
            'option_value_type' => 'number',
            'questionable' => quiz,
            'question_options_attributes' => {
              '0' => {
                'content' => '',
                'value' => 1
              }
            }
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
