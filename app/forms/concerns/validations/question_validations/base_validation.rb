module Validations
  module QuestionValidations
    module BaseValidation
      extend ActiveSupport::Concern

      included do
        protected

        def options_count
          question_options.count
        end

        def true_false_value
          %w[true false]
        end

        private

        def validation_conditions
          base_validation_conditions | question_validation_conditions
        end

        def base_validation_conditions
          [
            -> { question_options.all? { |opt| proper_value_type?(option_value_type, opt.value) } }
          ]
        end

        def question_validation_conditions
          raise NotImplementedError
        end

        def proper_value_type?(expected_type, value)
          case expected_type
          when 'string'
            String(value) && true
          when 'number'
            BigDecimal(value) && true
          when 'boolean'
            value.in?(true_false_value)
          else
            false
          end
        rescue ArgumentError
          false
        end
      end
    end
  end
end
