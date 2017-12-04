require "rails_helper"

RSpec.describe ScheduledChore, :type => :model do
  describe 'create_day_tasks' do
    before :each do
      @user = FactoryGirl.create(:user)
      FactoryGirl.create(:executed_chore, user: @user)
    end

    describe 'week_score' do
      it 'returns 0 when no chore was completed' do
        score = ExecutedChore.week_score(@user)
        expect(score).to eq 0
      end

      it 'returns non 0 when some chore was completed' do
        FactoryGirl.create(:executed_chore, user: @user, completed: true)
        score = ExecutedChore.week_score(@user)
        expect(score).to be > 0
      end

      it 'works with an offset for past week' do
        FactoryGirl.create(:executed_chore, user: @user, completed: true)
        score = ExecutedChore.week_score(@user, -1)
        expect(score).to eq 0
      end
    end

  end
end
