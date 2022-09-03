class Note < ApplicationRecord
  belongs_to :profile

  enum visibility: { privato: 0, gruppo_chiuso: 1, ticket: 2, pubblica: 3, full: 4 }
  enum note_type: { contatto: 0, gruppo: 1, preventivo: 2, evento: 3, data: 4, transazione: 5, luogo: 6, blog: 7,  attenzione: 8, note: 9, energia: 10, progetto: 11, merce: 12, abilita: 13 }
  
end
