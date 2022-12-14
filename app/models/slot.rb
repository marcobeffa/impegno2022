class Slot < ApplicationRecord
  belongs_to :profile
  belongs_to :calendar
  belongs_to :category, optional: true
  belongs_to :luogo, optional: true, class_name: 'Note', foreign_key: 'luogo_n_id'
  belongs_to :sublocation, optional: true
  belongs_to :event, optional: true

  has_many :prenotations
  has_many :noteslots


  

  enum visibility: { privato: 1, iscritti: 2, pubblico: 3}
end
