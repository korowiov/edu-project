module Validations
  module QuestionValidations
    module SingleAnswer
      include BaseValidation

      private

      def question_validation_conditions
        [
          -> { options_count.eql?(1) },
          -> { question_options.all? { |opt| !opt.content.present? } }
        ]
      end
    end
  end
end
