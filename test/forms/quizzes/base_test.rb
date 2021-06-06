require 'test_helper'

module FormsTests
  module QuizzesTests
    class BaseTest < ActiveSupport::TestCase
      def education_level
        @education_level ||=
          create(:education_level, name: 'Klasa podstawowa 4-6')
      end

      def subject
        @subject ||= create(:subject)
      end

      def quiz
        @quiz ||= create(:quiz)
      end
    end
  end
end
