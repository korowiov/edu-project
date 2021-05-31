require_relative 'base_test'

module FormsTests
  module QuizzesTests
    class UpdateTest < BaseTest
      def valid_params
        {
          name: 'new test quiz',
          description: 'new test description',
          education_level_id: education_level.id,
          subject_ids: [subject.id]
        }
      end

      def invalid_params
        {
          name: '',
          description: ''
        }
      end

      test 'validate valid params' do
        form = QuizForm.new(quiz)
        assert form.validate(valid_params)
      end

      test 'saves valid params' do
        form = QuizForm.new(quiz)
        form.validate(valid_params)

        assert_no_difference 'Quiz.count', 1 do
          form.save
        end
      end

      test 'returns object with update params' do
        form = QuizForm.new(Quiz.new)
        form.validate(valid_params)
        form.save

        record = form.model
        assert_equal valid_params[:name], record.name
        assert_equal valid_params[:description], record.description
        assert_equal education_level, record.education_level
        assert_equal [subject], record.subjects
      end

      test 'validate invalid params' do
        form = QuizForm.new(quiz)
        refute form.validate(invalid_params)
      end
    end
  end
end
