class NotesController < ApplicationController
    before_action :set_idea


 def new
    @note = Note.new
 end
 def create
    @note = Note.new(note_params.merge(idea:@idea))
    if @note.save
        redirect_to idea_notes_path(@idea), notice: 'Note was successfully created.'
    else   
        render :new 

    # respond_to do |format|
    #   if @idea.save
    #     format.html { redirect_to @note, notice: 'Note was successfully created.' }
    #     format.json { render :show, status: :created, location: @ }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @idea.errors, status: :unprocessable_entity }
    end
 end   
 def index
   @notes=Note.all
 end
def note_params
    params.require(:note).permit(:idea_id, :body, :author) 
end  
 
 def set_idea
    @idea = Idea.find(params[:idea_id])
 end   
 def show
    @note=Note.find(params[:id])
 end   
 def edit
    @note=Note.find(params[:id])
 end 
 def update
    @note = Note.new(note_params.merge(idea:@idea))
 
        if @note.update(note_params.merge(idea:@idea)) 
             redirect_to idea_note_path(@idea), notice: 'Note was successfully created.'

        else
            render:new
       
        end
   
 end     
end
