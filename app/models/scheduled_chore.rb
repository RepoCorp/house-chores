# == Schema Information
#
# Table name: scheduled_chores
#
#  id         :integer          not null, primary key
#  chore_id   :integer
#  user_id    :integer
#  monday     :boolean
#  tuesday    :boolean
#  wednesday  :boolean
#  thursday   :boolean
#  friday     :boolean
#  saturday   :boolean
#  sunday     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean
#

class ScheduledChore < ApplicationRecord
  belongs_to :chore
  belongs_to :user

  DOW_TO_FIELD = %w"sunday monday tuesday wednesday thursday friday saturday"

  def self.create_day_tasks
    ScheduledChore.where('active' => true,  today_dow => true).each do |scheduled_chore|
      ExecutedChore.create(chore: scheduled_chore.chore, user: scheduled_chore.user)
    end
  end

  def self.today_dow
    date_dow(Date.today)
  end

  def self.date_dow(date)
    DOW_TO_FIELD[date.wday]
  end

  def self.day_chores(date)
    ScheduledChore.where('active' => true,  date_dow(date) => true)
  end

  def html_class
    'scheduled-chore'
  end
end
