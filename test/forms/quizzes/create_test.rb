require_relative 'base_test'

module FormsTests
  module QuizzesTests
    class CreateTest < BaseTest
      def valid_params
        {
          name: 'test quiz',
          description: 'test description',
          education_level_id: education_level.id,
          subject_ids: [subject.id]
        }
      end

      def invalid_params
        {}
      end

      test 'validate valid params' do
        form = QuizForm.new(Quiz.new)
        assert form.validate(valid_params)
      end

      test 'save valid params' do
        form = QuizForm.new(Quiz.new)
        form.validate(valid_params)

        assert_difference 'Quiz.count', 1 do
          form.save
        end
      end

      test 'returns object with valid params' do
        form = QuizForm.new(Quiz.new)
        form.validate(valid_params)
        form.save

        record = form.model
        assert_equal Quiz, record.class
        assert record.persisted?
        assert_equal valid_params[:name], record.name
        assert_equal valid_params[:description], record.description
        assert_equal education_level, record.education_level
        assert_equal [subject], record.subjects
      end

      test 'validate invalid params' do
        form = QuizForm.new(Quiz.new)
        refute form.validate(invalid_params)
      end

      test 'does not save invalid params' do
        form = QuizForm.new(Quiz.new)
        form.validate(invalid_params)

        assert_no_difference 'Quiz.count' do
          form.save
        end
      end
    end
  end
end
