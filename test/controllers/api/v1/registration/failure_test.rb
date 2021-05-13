require 'test_helper'

module ApiTests
  module V1Tests
    module RegistrationTests
      class FailureTest < ActionDispatch::IntegrationTest
        def setup
          @params = {
            email: 'test@example.com'
          }
        end

        def make_request
          post account_registration_url, params: @params
        end

        test 'should not create account' do
          assert_no_difference 'Account.count' do
            make_request
          end
        end

        test 'should return unprocessable entity' do
          make_request
          assert_response :unprocessable_entity
        end
      end
    end
  end
end
