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
        day_data = ExecutedChore.day_chores(date)
      end
      @chores_data << day_data.where(user: current_user)
    end
    @todays_chores = ExecutedChore.day_chores(Date.current).where(user: current_user)
    @week_score = ExecutedChore.week_score(current_user)
    @last_week_score = ExecutedChore.week_score(current_user,-1)
  end

  def update
    ExecutedChore.update_completion(params, current_user)
    redirect_to action: "show"
  end
end
