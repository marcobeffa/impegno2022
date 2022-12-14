class SublocationsController < ApplicationController
  before_action :set_sublocation, only: %i[ show edit update destroy ]

  # GET /sublocations or /sublocations.json
  def index
    @sublocations = Sublocation.all
  end

  # GET /sublocations/1 or /sublocations/1.json
  def show
  end

  # GET /sublocations/new
  def new
    @sublocation = Sublocation.new
  end

  # GET /sublocations/1/edit
  def edit
  end

  # POST /sublocations or /sublocations.json
  def create
    @sublocation = Sublocation.new(sublocation_params)

    respond_to do |format|
      if @sublocation.save
        format.html { redirect_to sublocation_url(@sublocation), notice: "Sublocation was successfully created." }
        format.json { render :show, status: :created, location: @sublocation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sublocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sublocations/1 or /sublocations/1.json
  def update
    respond_to do |format|
      if @sublocation.update(sublocation_params)
        format.html { redirect_to sublocation_url(@sublocation), notice: "Sublocation was successfully updated." }
        format.json { render :show, status: :ok, location: @sublocation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sublocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sublocations/1 or /sublocations/1.json
  def destroy
    @sublocation.destroy

    respond_to do |format|
      format.html { redirect_to sublocations_url, notice: "Sublocation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sublocation
      @sublocation = Sublocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sublocation_params
      params.require(:sublocation).permit(:note_id, :name, :description, :img_quadrata_url, :img_ret_orizzontale, :img_ret_verticale, :num_posti_max, :num_location, :public, :visibility)
    end
end
