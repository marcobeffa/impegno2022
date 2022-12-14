class Category < ApplicationRecord
  belongs_to :profile
  belongs_to :calendar
  has_many :slots
end
