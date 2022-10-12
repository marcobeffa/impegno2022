class Noteslot < ApplicationRecord
  belongs_to :profile
  belongs_to :slot
  belongs_to :note
end
