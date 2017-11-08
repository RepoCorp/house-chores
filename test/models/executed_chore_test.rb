# == Schema Information
#
# Table name: executed_chores
#
#  id         :integer          not null, primary key
#  chore_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ExecutedChoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
