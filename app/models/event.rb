class Event < ApplicationRecord
  belongs_to :profile
  belongs_to :calendar, optional: true
  belongs_to :category, optional: true
  has_many :slots
end
