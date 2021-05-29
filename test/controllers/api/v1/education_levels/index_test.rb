require_relative 'base_test'

module ApiTests
  module V1Tests
    module EducationLevelsControllerTest
      class IndexTest < BaseTest
        def make_request
          get api_v1_education_levels_url
        end

        test 'should return ok' do
          make_request
          assert_response :ok
        end

        test 'responds with proper json' do
          expected_json =
            serialized_collection([
                                    education_level1,
                                    education_level2
                                  ])

          make_request
          assert_equal expected_json, json_response
        end
      end
    end
  end
end
