class Note < ApplicationRecord
  belongs_to :profile
  
  def note_t 
    Note.all.each do |note|
      if  note.note_type > 8
        note.update(note_type: 0)
      end
    end
  end

  enum visibility: { privato: 0, gruppo_chiuso: 1, ticket: 2, pubblica: 3, full: 4 }
  enum note_type: { note: 0, eventi: 1, soldi: 2, energie: 3, accessi: 4, attenzione: 5, luoghi: 6, abilita: 7, attivita: 8}
  enum accesso_type: { contatto: 0, gruppo: 1 }
  enum soldi_type: { preventivo: 0, progetto: 1, acquisto: 2, vendita: 3, presto: 4, restituzione_prestito: 5, chiedo_prestito: 6, restituisco: 7  }

end
