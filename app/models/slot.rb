class Slot < ApplicationRecord
  belongs_to :profile
  belongs_to :calendar
  has_many :noteslots


  enum visibility: { privato: 1, iscritti: 2, pubblico: 3}
end
