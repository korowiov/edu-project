class Subject < ApplicationRecord
  include Slugable

  has_many :children_subjects, class_name: 'Subject',
                               foreign_key: :parent_id

  belongs_to :parent_subject, class_name: 'Subject',
                              foreign_key: :parent_id,
                              optional: true

  scope :order_by_slug, -> { order(slug: :asc) }
  scope :roots, -> { where(parent_id: nil) }
  scope :with_parent_subject, -> { eager_load(:parent_subject) }

  def full_title
    ''.tap do |str|
      str << "#{parent_subject.title} - " if parent_subject.present?
      str << title.to_s
    end
  end

  def as_json(_options = {})
    super(methods: [:full_title])
  end
end
