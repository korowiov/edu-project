ActiveAdmin.register Question do
  belongs_to :quiz
  before_filter :skip_sidebar!, only: :index

  permit_params :name,
                :content,
                :question_type,
                :questionable,
                question_options_attributes: %i[id content value value_type]

  includes :author, :question_options

  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :content
      f.input :question_type, as: :select,
                              label: 'Question type',
                              collection: Question.question_types.keys.map { |k| [k.humanize, k] }
      f.has_many :question_options do |item|
        item.input :content
        item.input :value_type, as: :select,
                                label: 'Value type',
                                collection: QuestionOption.value_types.keys.map { |k| [k.humanize, k] }
        item.input :value
      end
    end
    f.actions
  end
end
