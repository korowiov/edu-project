module Api
  module V1
    class SubjectsController < ::Api::BaseApiController
      def index
        @subjects = Subject.roots.with_childs

        render_collection(
          @subjects,
          SubjectSerializer
        )
      end
    end
  end
end
