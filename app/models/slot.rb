class Slot < ApplicationRecord
  belongs_to :profile
  belongs_to :calendar
end
