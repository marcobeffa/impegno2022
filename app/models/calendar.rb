class Calendar < ApplicationRecord
  belongs_to :profile
  has_many :slots
end
