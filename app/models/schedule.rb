class Schedule < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :activity
end
