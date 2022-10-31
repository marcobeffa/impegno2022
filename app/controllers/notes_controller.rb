class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]

  # GET /notes or /notes.json
  def index
   

    if params[:date]
      date = params[:date]
      year = date[0, 4].to_i  
      month = date[5, 6].to_i 
      if month < 10 
        month = "0" + month.to_s
      end   
      day = date[8, 9].to_i  
      if day < 10 
        day =   "0" + day.to_s
      end  
      @data_start = DateTime.new(year.to_i,month.to_i,day.to_i) 
      
      @data_f = year.to_s + "-" + month.to_s  + "-" + day.to_s   
    else
      @data_start = DateTime.now
      @data_f = DateTime.now.strftime("%Y-%m-%d")
     # @notes = current_user.profile.notes.where(:start => @data_start.beginning_of_day..@data_start.end_of_day)   
     # @scheduledates = current_user.profiles.first.scheduledates.where(:start => @data_start.beginning_of_day..@data_start.end_of_day)   
    end 
    @notes = current_user.profile.notes.where("data_start > ?", @data_start.beginning_of_day ) 
    if @notes
      @notes =  @notes.order(data_start: :desc)
    end 
    @profile = current_user.profile
  end

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = current_user.profile.notes.build
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    @note = current_user.profile.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to note_url(@note), notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_url(@note), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:profile_id, :name, :description, :body, :note_type, :euro_pagati, :euro_ricevuti, :data_start, :data_end, :lat, :long, :google_maps_url, :stato_attention, :visibility, :pubblica)
    end
end
