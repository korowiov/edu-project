module Questions
  class Create < Patterns::Action
    set_form_klass QuestionForm
    set_model_klass Question

    def initialize(params: {}, parent: nil)
      @parent = parent
      super(params: params)
    end

    private

    attr_reader :parent

    def resource_created?
      form.validate(extended_params) && form.save
    end

    def extended_params
      params.tap do |hsh|
        hsh[:questionable] = parent if parent.created?
      end
    end
  end
end
