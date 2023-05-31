# frozen_string_literal: true

class CreateNoteService
    attr_reader :params, :note
  
    def initialize(params)
      @params = params
    end
  
    def create
      @note = Note.new(params)
  
      Note.transaction do
        return false unless note.save
  
        touch_parent
      end
    end
  
    private
  
    def touch_parent
      return unless note.notable
      return unless %w[Candidate Contact].include?(note.notable_type)
  
      note.notable.update_column(:last_note_added_at, Time.zone.now)
    end
  end