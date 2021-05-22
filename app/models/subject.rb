class Subject < ApplicationRecord
  include Slugable

  has_many :childrens, class_name: 'Subject',
                       foreign_key: :parent_id

  belongs_to :parent, class_name: 'Subject',
                      foreign_key: :parent_id,
                      optional: true

  scope :order_by_slug, -> { order(slug: :asc) }
  scope :roots, -> { where(parent_id: nil) }
  scope :with_parent, -> { eager_load(:parent) }
  scope :with_childs, -> { eager_load(:childrens) }

  def full_title
    ''.tap do |str|
      str << "#{parent.name} - " if parent.present?
      str << name.to_s
    end
  end

  def root?
    parent_id.nil?
  end

  def as_json(_options = {})
    super(methods: [:full_title])
  end
end
