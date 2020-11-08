class Activity < ApplicationRecord
  enum kind: {
    online: 'online',
    indoor: 'indoor',
    outdoor: 'outdoor'
  }

  has_many :schedules
end
