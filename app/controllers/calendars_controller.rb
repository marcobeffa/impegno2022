class CalendarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_calendar, only: %i[ show edit update destroy pastslot noslot todoslot future passate settimana]

  # GET /calendars or /calendars.json
  def index
    @calendars = Calendar.all
  end

  # GET /calendars/1 or /calendars/1.json
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
    @slots = @calendar.slots.where("data_start < ?", @data_start.beginning_of_day ) 
    if @slots
      @slots =  @slots.order(data_start: :desc)
    end 
    @profile = @calendar.profile
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
    @slots = @calendar.slots.where("data_start > ?", @data_start.beginning_of_day )
    if @slots
      @slots =  @slots.order(data_start: :asc)
    end 
    @profile = @calendar.profile
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
      @data_start = DateTime.new(year.to_i,month.to_i,day.to_i).beginning_of_week(start_day = :monday)
      
      @data_f = year.to_s + "-" + month.to_s  + "-" + day.to_s   
    else
      @data_start = DateTime.now.beginning_of_week(start_day = :monday)
      @data_f = DateTime.now.strftime("%Y-%m-%d")
     
     # @scheduledates = current_user.profiles.first.scheduledates.where(:start => @data_start.beginning_of_day..@data_start.end_of_day)   
    end 
   

    @wkBegin = @data_start
    @wkEnd = (@data_start + 7.day).end_of_day
    @notes = @calendar.profile.notes.where(:start => @data_start.beginning_of_week..(@data_start.end_of_week + 23.hour))   
    @datas = @calendar.profile.notes.where(note_type: "data").where('data_start > ? AND data_end < ?',  @wkBegin, @wkEnd)  
    
    
    @new_data = params[:new_data]
  end

  def show
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
    @slots = @calendar.slots.where("data_start > ?", @data_start.beginning_of_day ) 
    if @slots
      @slots =  @slots.order(data_start: :desc)
    end 
    @profile = @calendar.profile
  end

  def pastslot
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
    # @slots = @calendar.slots.where(:start => @data_start.beginning_of_day..@data_start.end_of_day)   
    # @scheduledates = current_user.profiles.first.scheduledates.where(:start => @data_start.beginning_of_day..@data_start.end_of_day)   
    end 
    @slots = @calendar.slots.where("data_start < ?", @data_start.beginning_of_day )
    if @slots
      @slots =  @slots.order(data_start: :asc)
    end 
    @profile = @calendar.profile
  end

  def noslot
    @slots = @calendar.slots.where(data_start: nil )
  end
  def todoslot
    @slots = @calendar.slots.where(data_end: nil )
  end
  

  # GET /calendars/new
  def new
    @calendar = current_user.profile.calendars.build
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars or /calendars.json
  def create
    @calendar = current_user.profile.calendars.build(calendar_params)

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to calendar_url(@calendar), notice: "Calendar was successfully created." }
        format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1 or /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to calendar_url(@calendar), notice: "Calendar was successfully updated." }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1 or /calendars/1.json
  def destroy
    @calendar.destroy

    respond_to do |format|
      format.html { redirect_to calendars_url, notice: "Calendar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calendar_params
      params.require(:calendar).permit(:profile_id, :name, :description, :body, :image_square_url, :image_logo_url, :calendar_type, :luogo_note_id, :attivita_note_id, :gruppo_note_id, :public, :visibility,:data_start, :data_end, :responsabile_profile_id, :entrate, :uscite, :zoom_index, :hex_color)
    end
end
