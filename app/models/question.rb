class Question < ApplicationRecord
  enum question_type: {
    single_answer: 'single_answer',
    single_pick: 'single_pick',
    multiple_pick_type: 'multiple_pick'
  }

  has_many :question_options, inverse_of: :question
  belongs_to :questionable, polymorphic: true,
                            dependent: :destroy

  accepts_nested_attributes_for :question_options, allow_destroy: true
end
