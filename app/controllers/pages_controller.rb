
class PagesController < ApplicationController
  def home
    if user_signed_in?
      if current_user.profile
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
          @notes =  @notes.order(data_start: :asc)
        end 
        @profile = current_user.profile
      end
    end
  end

  def about
  end
end
