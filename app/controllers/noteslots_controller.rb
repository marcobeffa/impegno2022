class NoteslotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_noteslot, only: %i[ show edit update destroy ]

  # GET /noteslots or /noteslots.json
  def index
    @noteslots = Noteslot.all
  end

  # GET /noteslots/1 or /noteslots/1.json
  def show
  end

  # GET /noteslots/new
  def new
    @noteslot = Noteslot.new
  end

  # GET /noteslots/1/edit
  def edit
  end

  # POST /noteslots or /noteslots.json
  def create
    @noteslot = Noteslot.new(noteslot_params)

    respond_to do |format|
      if @noteslot.save
        format.html { redirect_to noteslot_url(@noteslot), notice: "Noteslot was successfully created." }
        format.json { render :show, status: :created, location: @noteslot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @noteslot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noteslots/1 or /noteslots/1.json
  def update
    respond_to do |format|
      if @noteslot.update(noteslot_params)
        format.html { redirect_to noteslot_url(@noteslot), notice: "Noteslot was successfully updated." }
        format.json { render :show, status: :ok, location: @noteslot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @noteslot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noteslots/1 or /noteslots/1.json
  def destroy
    @noteslot.destroy

    respond_to do |format|
      format.html { redirect_to noteslots_url, notice: "Noteslot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noteslot
      @noteslot = Noteslot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def noteslot_params
      params.require(:noteslot).permit(:profile_id, :slot_id, :note_id, :note_type)
    end
end
