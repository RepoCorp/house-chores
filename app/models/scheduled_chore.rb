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
#

class ScheduledChore < ApplicationRecord
  belongs_to :chore
  belongs_to :user
end
