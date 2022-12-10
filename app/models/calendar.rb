class Calendar < ApplicationRecord
  belongs_to :profile
  has_many :slots
  has_many :categories
end
