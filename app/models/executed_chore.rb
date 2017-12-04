# == Schema Information
#
# Table name: executed_chores
#
#  id         :integer          not null, primary key
#  chore_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  completed  :boolean          default(FALSE)
#

class ExecutedChore < ApplicationRecord
  belongs_to :user
  belongs_to :chore

  def self.day_chores(date)
    ExecutedChore.where(created_at: date.midnight..date.end_of_day)
  end

  def self.update_completion(params, current_user)
    ExecutedChore.day_chores(Date.current).where(user: current_user).each do |day_chore|
      completed = params['chore'].present? and params['chore'][day_chore.id.to_s].present?
      day_chore.update_attribute(:completed, completed)
    end
  end

  def self.week_score(user, offset = 0)
    first_date = (Date.current.beginning_of_week + offset.day).beginning_of_week
    last_date = first_date + 7.day
    all_chores = ExecutedChore.where(user: user, created_at: first_date.midnight..last_date.end_of_day)
    return 0 if all_chores.count == 0
    completed_cores = all_chores.where(completed: true)
    (completed_cores.count.to_f/all_chores.count * 100).to_i
  end

  def html_class
    completed == true ? 'completed-chore':'uncompleted-chore'
  end
end
