class Prenotation < ApplicationRecord
  belongs_to :contact
  belongs_to :slot
  belongs_to :event
  belongs_to :user
  belongs_to :profile
end
