ActiveAdmin.register EducationLevel do
  before_filter :skip_sidebar!, only: :index

  menu parent: 'Association resources', priority: 1

  permit_params :name

  actions :all, except: %i[show]

  form do |f|
    f.semantic_errors(*f.object.errors.keys)
    f.inputs do
      f.input :name
    end
    f.actions
  end

  controller do
    def create
      build_resource
      @education_level.set_slug!
      create!
    end
  end
end
