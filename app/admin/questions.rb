ActiveAdmin.register Question do
  belongs_to :quiz
  before_filter :skip_sidebar!, only: :index

  permit_params :name,
                :content,
                :question_type,
                :option_value_type,
                :questionable,
                question_options_attributes: %i[id content value]

  includes :author, :question_options

  controller do
    def create
      action = Questions::Create.new(
        params: permitted_params[:question].to_h,
        parent: parent
      )
      result = action.call
      @question = action.resource
      if result
        redirect_to parent_path
      else
        flash[:error] = 'Your form is missing or has incomplete fields. Please review your entry below.'
        render action: 'new'
      end
    end
  end

  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :content
      f.input :question_type, as: :select,
                              label: 'Question type',
                              collection: Question.question_types.keys.map { |k| [k.humanize, k] }
      f.input :option_value_type, as: :select,
                                  label: 'Option value type',
                                  collection: Question.option_value_types.keys.map { |k| [k.humanize, k] }
      f.has_many :question_options do |item|
        item.input :content
        item.input :value
      end
    end
    f.actions
  end
end
