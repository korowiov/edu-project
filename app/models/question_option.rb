class QuestionOption < ApplicationRecord
  enum value_type: {
    boolean: 'boolean',
    string: 'string',
    number: 'number'
  }

  belongs_to :question, inverse_of: :question_options
end
