require 'webmock/minitest'
require 'minitest/autorun'
require 'mocha/minitest'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  # parallelize(workers: :number_of_processors)

  def json_response
    ActiveSupport::JSON.decode @response.body
  end
end
