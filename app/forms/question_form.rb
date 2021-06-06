class QuestionForm < Patterns::Form
  model Question

  properties :content,
             :question_type,
             :option_value_type,
             :questionable

  collection :question_options, populate_if_empty: QuestionOption do
    properties :id, :content, :value
  end

  validates :content, presence: true
  validates :question_type, inclusion: { in: Question.question_types.keys }
  validates :option_value_type, inclusion: { in: Question.option_value_types.keys }
  validates :questionable, presence: true
  validate :valid_questionable_state
  validate :valid_question_options

  private

  def extend_validation!
    extend validation_class.constantize
  end

  def valid_question_options
    unless errors.any?
      extend_validation!
      errors.add(:question_options, :invalid) unless validation_conditions_fulfilled?
    end
  end

  def valid_questionable_state
    unless errors.any?
      errors.add(:questionable, :invalid) unless questionable.created?
    end
  end

  def validation_conditions_fulfilled?
    validation_conditions.inject(true) do |value, condition|
      return value unless value

      condition.call
    end
  end

  def validation_class
    "Validations::QuestionValidations::#{question_type.classify}"
  end
end
