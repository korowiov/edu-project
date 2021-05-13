require 'test_helper'

module ApiTests
  module V1Tests
    module RegistrationTests
      class SuccessTest < ActionDispatch::IntegrationTest
        def setup
          @params = {
            email: 'test@example.com',
            password: 'TestPa$$1234',
            password_confirmation: 'TestPa$$1234',
            nickname: 'nickname'
          }
        end

        def make_request
          post account_registration_url, params: @params
        end

        def last_created_account
          Account.last
        end

        test 'should create account' do
          assert_difference 'Account.count', 1 do
            make_request
          end
        end

        test 'should return success' do
          make_request
          assert_response :success
        end
      end
    end
  end
end
