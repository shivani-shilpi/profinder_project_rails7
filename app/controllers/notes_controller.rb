class NotesController < ApplicationController
    # before_action :authenticate_agent!, except: :index
    before_action :load_notable
    
    def new
        @note = @notable.notes.new
    end 

    def create
        @note = @notable.notes.new(note_params)
        if @notable.save
            redirect_to @notable, notice: "Note is Created."
        else 
            render :new
        end
    end 

    def destroy
        @note = Note.find(params[:id])
        if @note.destroy
            redirect_to @notable, notice: "Note deleted." 
        end
    end

    def edit
        @note = Note.find(params[:id])
    end

    def update
        @note = Note.find(params[:id])
        if @note.update(note_params)
            redirect_to @notable, notice: "Note is Updated"
        else
            render :edit
        end
    end

    private
     
    def load_notable
        if params[:image_id]
            @notable = Image.find(params[:image_id])
        else 
            @notable = Plant.find(params[:plant_id])
        end
    end

    def note_params
       params.require(:note).permit(:title, :body, :content) 
    end
end
