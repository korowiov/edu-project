class SubjectSerializer < Patterns::Serializer
  attributes :name, :slug
  attribute :childrens, if: -> { object.root? }

  def childrens
    (object.childrens || []).map do |subject|
      SubjectSerializer.new(subject, root: false).serializable_hash
    end
  end
end
