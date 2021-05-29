module Api
  module V1
    class EducationLevelsController < ::Api::BaseApiController
      def index
        @education_levels = EducationLevel.all

        render_collection(
          @education_levels,
          EducationLevelSerializer
        )
      end
    end
  end
end
