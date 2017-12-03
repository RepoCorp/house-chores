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
end
