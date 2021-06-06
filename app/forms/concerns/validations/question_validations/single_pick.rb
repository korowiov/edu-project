module Validations
  module QuestionValidations
    module SinglePick
      include BaseValidation

      private

      def question_validation_conditions
        [
          -> { options_count.eql?(4) },
          -> { question_options.all? { |opt| opt.content.present? } },
          -> { question_options.all? { |opt| opt.value.in? true_false_value } },
          -> { question_options.one? { |opt| opt.value.eql?('true') } }
        ]
      end
    end
  end
end
