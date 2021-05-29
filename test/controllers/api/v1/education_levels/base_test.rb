require 'test_helper'

module ApiTests
  module V1Tests
    module EducationLevelsControllerTest
      class BaseTest < ActionDispatch::IntegrationTest
        def education_level1
          @education_level1 ||=
            create(:education_level, name: 'Klasa podstawowa 4-6')
        end

        def education_level2
          @education_level2 ||=
            create(:education_level, name: 'Klasa podstawowa 7-8')
        end

        def serialized_collection(arr)
          arr.map do |education_level|
            education_level.slice(:name, :slug)
          end
        end

        def setup
          education_level1
          education_level2
        end
      end
    end
  end
end
