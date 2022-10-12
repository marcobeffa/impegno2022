class PrivataController < ApplicationController
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
    @slots = current_user.profile.slots.where("data_start < ?", @data_start.beginning_of_day )
    if @slots
      @slots =  @slots.order(data_start: :asc)
    end 
    @profile = current_user.profile
  end

  def noslot
    @slots = current_user.profile.slots.where(data_start: nil )
  end
  def todoslot
    @slots = current_user.profile.slots.where(data_end: nil )
  end
  
end
