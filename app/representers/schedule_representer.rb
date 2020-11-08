# frozen_string_literal: true

class ScheduleRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :place
  property :date, exec_context: :decorator
  property :hour, exec_context: :decorator
  property :activity, decorator: ActivityRepresenter, class: Activity

  def date
    represented.date.strftime('%F')
  end

  def hour
    represented.date.strftime('%H:%M')
  end
end
