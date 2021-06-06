require 'test_helper'

module FormsTests
  module QuestionsTests
    module CreateTests
      class BaseTest < ActiveSupport::TestCase
        def quiz
          @quiz ||= create(:quiz)
        end
      end
    end
  end
end
