module Slugable
  extend ActiveSupport::Concern

  included do
    validates :slug, presence: true, uniqueness: true
  end

  def set_slug!
    if should_set_slug?
      counter = 0
      self.slug =
        loop do
          generated_slug = generate_slug(counter)

          break generated_slug unless self.class.exists?(slug: generated_slug)

          counter += 1
        end
    end
  end

  private

  def generate_slug(counter)
    ''.tap do |elements|
      elements << parent_subject.slug + ' ' if parent_subject.present?
      elements << name + ' '
      elements << counter if counter.positive?
    end.parameterize
  end

  def should_set_slug?
    new_record? || parent_id_changed?
  end
end
