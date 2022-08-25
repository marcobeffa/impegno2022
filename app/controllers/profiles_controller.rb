class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy passate future settimana ]

  # GET /profiles or /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1 or /profiles/1.json
  def show
  end

  def passate
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
    @notes = @profile.notes.where(note_type: ["data", "slot"], pubblica: true).where("data_start < ?", @data_start.beginning_of_day ) 

  end

  def future
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
    @notes = @profile.notes.where(note_type: ["data", "slot"], pubblica: true ).where("data_start > ?", @data_start.beginning_of_day ) 

  end

  def settimana
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
     
     # @scheduledates = current_user.profiles.first.scheduledates.where(:start => @data_start.beginning_of_day..@data_start.end_of_day)   
    end 
    @notes = @profile.notes.where(:start => @data_start.beginning_of_week..(@data_start.end_of_week + 23.hour))   
   
  end
  # GET /profiles/new
  def new
    @profile = current_user.build_profile
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = current_user.build_profile(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:user_id, :title, :description, :avatar_url, :name, :surname, :username, :email, :phone, :smartphone, :prezzo_orario, :active_profile_id, :team_id, :referente_profile_id)
    end
end
