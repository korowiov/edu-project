ActiveAdmin.register Subject do
  before_filter :skip_sidebar!, only: :index

  menu parent: 'Association resources', priority: 1

  includes :parent_subject

  permit_params :name,
                :parent_id

  actions :all, except: %i[show]

  form do |f|
    f.semantic_errors(*f.object.errors.keys)
    f.inputs do
      f.input :name
      f.input :parent_id, as: :select,
                          label: 'Parent',
                          required: false,
                          collection: Subject.roots.map do |s|
                            [s.title, s.id]
                          end
    end
    f.actions
  end

  controller do
    def create
      build_resource
      @subject.set_slug!
      create!
    end
  end
end
