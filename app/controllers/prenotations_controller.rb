class PrenotationsController < ApplicationController
  before_action :set_prenotation, only: %i[ show edit update destroy ]

  # GET /prenotations or /prenotations.json
  def index
    @prenotations = Prenotation.all
  end

  # GET /prenotations/1 or /prenotations/1.json
  def show
  end

  # GET /prenotations/new
  def new
    @prenotation = Prenotation.new
  end

  # GET /prenotations/1/edit
  def edit
  end

  # POST /prenotations or /prenotations.json
  def create
    @prenotation = Prenotation.new(prenotation_params)

    respond_to do |format|
      if @prenotation.save
        format.html { redirect_to prenotation_url(@prenotation), notice: "Prenotation was successfully created." }
        format.json { render :show, status: :created, location: @prenotation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prenotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prenotations/1 or /prenotations/1.json
  def update
    respond_to do |format|
      if @prenotation.update(prenotation_params)
        format.html { redirect_to prenotation_url(@prenotation), notice: "Prenotation was successfully updated." }
        format.json { render :show, status: :ok, location: @prenotation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prenotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prenotations/1 or /prenotations/1.json
  def destroy
    @prenotation.destroy

    respond_to do |format|
      format.html { redirect_to prenotations_url, notice: "Prenotation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prenotation
      @prenotation = Prenotation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prenotation_params
      params.require(:prenotation).permit(:contact_id, :slot_id, :event_id, :user_id, :email, :confermata, :profile_id, :pagamento_tipo, :data_pagamento, :fattura_n, :fattura_anno, :price_value, :name, :description, :tipo_prenotazione, :telefono, :stato_prenotazione, :public, :visibility)
    end
end
