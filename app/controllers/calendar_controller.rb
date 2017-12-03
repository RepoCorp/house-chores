class CalendarController < ApplicationController
  before_action :authenticate_user!

  def show
    @chores_data = []
    start_date = params[:start_date]? Date.parse(params[:start_date]) : Date.current.beginning_of_month.beginning_of_week
    sd = start_date
    ed = sd + 35.days
    sd.upto(ed) do |date|
      if date.future?
        day_data = ScheduledChore.day_chores(date)
      else
        day_data = ExecutedChore.where(created_at: date.midnight..date.end_of_day)
      end
      @chores_data << day_data.where(user: current_user)
    end
  end
end
