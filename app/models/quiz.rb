class Quiz < Resource
  has_many :questions, as: :questionable, dependent: :destroy

  accepts_nested_attributes_for :questions, allow_destroy: true
end
