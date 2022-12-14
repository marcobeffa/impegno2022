class Sublocation < ApplicationRecord
  belongs_to :note
  has_many :slots
end
