# frozen_string_literal: true

class BookingRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :ticket
  property :schedule, decorator: ScheduleRepresenter, class: Schedule
end
