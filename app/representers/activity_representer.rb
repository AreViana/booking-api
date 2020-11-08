# frozen_string_literal: true

class ActivityRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :name
  property :kind
end
