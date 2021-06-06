ActiveAdmin.register Quiz do
  before_filter :skip_sidebar!, only: :index

  permit_params :name,
                :description,
                :education_level_id,
                subject_ids: []

  includes :subjects, :education_level

  scope :all
  scope :created
  scope :published, default: true
  scope :removed

  member_action :publish, method: :put do
    resource.published!
    redirect_to admin_quiz_path(resource), notice: 'Published!'
  end

  member_action :remove, method: :put do
    resource.removed!
    redirect_to admin_quiz_path(resource), notice: 'Removed!'
  end

  controller do
    def create
      action = Quizzes::Create.new(params: permitted_params[:quiz].to_h)
      res = action.call
      @quiz = action.resource
      if res
        redirect_to resource_path
      else
        render 'new'
      end
    end

    def update
      action = Quizzes::Edit.new(params: permitted_params[:quiz].to_h, object: resource)
      res = action.call
      @quiz = action.resource
      if res
        redirect_to resource_path
      else
        render 'edit'
      end
    end
  end

  index do
    id_column
    column :name
    column :education_level do |quiz|
      quiz.education_level.name
    end
    column :state
    column :created_at
    column :published_at
    actions defaults: false do |quiz|
      item('Edit', edit_admin_quiz_path(quiz), method: :get, class: 'member_link') if quiz.created?
      item('Publish', publish_admin_quiz_path(quiz), method: :put, class: 'member_link') unless quiz.published?
      item('Remove', remove_admin_quiz_path(quiz), method: :put, class: 'member_link') unless quiz.removed?
    end
  end

  show do
    panel 'Quiz' do
      attributes_table_for quiz do
        row :id
        row :name
        row :description
        row :education_level do |quiz|
          quiz.education_level.name
        end
        row :subjects do |quiz|
          quiz.subjects.map(&:name)
        end
        row :state
        tr class: 'action_items' do
          td link_to('New question', new_admin_quiz_question_path(quiz), class: :button) if quiz.created?
        end
      end
    end

    panel 'Questions' do
      table_for quiz.questions do
        column :id
        column :content
        column 'Link' do |question|
          link_to 'Show question', admin_quiz_question_path(question)
        end
      end
    end
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)
    f.inputs do
      f.input :name
      f.input :description
      f.input :education_level, as: :select,
                                label: 'Education level',
                                collection: EducationLevel.all,
                                display_name: :name
      f.input :subject_ids, as: :tags,
                            label: 'Subjects',
                            collection: Subject.order_by_slug,
                            display_name: :full_title
    end
    f.actions
  end
end
