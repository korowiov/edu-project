require 'test_helper'

module ApiTests
  module V1Tests
    module SubjectsControllerTest
      class BaseTest < ActionDispatch::IntegrationTest
        def subject_parent1
          @subject_parent1 ||=
            create(:subject, name: 'Biologia')
        end

        def subject_child1
          @subject_child1 ||=
            create(:subject, name: 'Genetyka', parent_id: subject_parent1.id)
        end

        def subject_parent2
          @subject_parent2 ||=
            create(:subject, name: 'Chemia')
        end

        def subject_child2
          @subject_child2 ||=
            create(:subject, name: 'Organiczna', parent_id: subject_parent2.id)
        end

        def subject_parent3
          @subject_parent3 ||=
            create(:subject, name: 'Matematyka')
        end

        def subject_child3
          @subject_child3 ||=
            create(:subject, name: 'Algebra', parent_id: subject_parent3.id)
        end

        def subject_child4
          @subject_child4 ||=
            create(:subject, name: 'Geometria', parent_id: subject_parent3.id)
        end

        def serialized_collection(arr)
          arr.map do |subject|
            hsh = subject.slice(:name, :slug)
            hsh[:childrens] = serialized_collection(subject.childrens) if subject.childrens.any?
            hsh
          end
        end

        def setup
          subject_parent1
          subject_parent2
          subject_parent3
          subject_child1
          subject_child2
          subject_child3
          subject_child4
        end
      end
    end
  end
end
