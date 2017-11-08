class CalendarController < ApplicationController
  def show
    start_date = params[:start_date]
    sd = Date.parse(start_date)
    ed = sd + 35.days
    @chores_data = []
    sd.upto(ed) do |date|
      day_data = {}
      weekday = date.wday
      scheduled_chores = ScheduledChore.none
      if weekday == 0
        scheduled_chores = ScheduledChore.where(monday: true).to_a
      end
      day_data[:scheduled_chores] = scheduled_chores
      @chores_data << day_data
    end
  end
end
