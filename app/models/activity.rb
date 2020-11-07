class Activity < ApplicationRecord
  enum kind: {
    online: 'online',
    indoor: 'indoor',
    outdoor: 'outdoor'
  }
end
