class Activity < ApplicationRecord
  enum type: {
    online: 'online',
    indoor: 'indoor',
    outdoor: 'outdoor'
  }
end
