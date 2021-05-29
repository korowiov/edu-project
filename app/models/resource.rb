class Resource < ApplicationRecord
  enum state: {
    created: 'created',
    published: 'published',
    removed: 'removed'
  }

  has_many :resource_subjects, as: :subjectable
  has_many :subjects, through: :resource_subjects

  belongs_to :education_level

  scope :created, -> { where(state: 'created') }
  scope :published, -> { where(state: 'published') }
  scope :removed, -> { where(state: 'removed') }

  def published!
    update(state: 'published', published_at: DateTime.now)
  end

  def removed!
    update_column(:state, 'removed')
  end

  states.keys.each do |key|
    define_method "#{key}?" do
      send(:state).eql?(key.to_s)
    end
  end
end
