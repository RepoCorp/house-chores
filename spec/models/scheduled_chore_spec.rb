require "rails_helper"

RSpec.describe ScheduledChore, :type => :model do
  describe 'create_day_tasks' do
    before :each do
      allow(Date).to receive(:today).and_return Date.new(2017,12,4)
      FactoryGirl.create(:scheduled_chore)
    end

    it 'creates the executed chore' do
      ScheduledChore.create_day_tasks
      expect(ExecutedChore.count).to eq 1
    end

    it 'doesnt create an inactive chore' do
      FactoryGirl.create(:scheduled_chore, active: false)
      ScheduledChore.create_day_tasks
      expect(ExecutedChore.count).to eq 1
    end

    it 'doesnt create a chore for another dow' do
      allow(Date).to receive(:today).and_return Date.new(2017,12,3)
      ScheduledChore.create_day_tasks
      expect(ExecutedChore.count).to eq 0
    end
  end

  describe 'today_dow' do
    it 'correctly returns monday' do
      allow(Date).to receive(:today).and_return Date.new(2017,12,4)
      expect(ScheduledChore.today_dow).to eq 'monday'
    end

    it 'correctly returns sunday' do
      allow(Date).to receive(:today).and_return Date.new(2017,12,3)
      expect(ScheduledChore.today_dow).to eq 'sunday'
    end

    it 'correctly returns wednesday' do
      allow(Date).to receive(:today).and_return Date.new(2017,11,29)
      expect(ScheduledChore.today_dow).to eq 'wednesday'
    end
  end
end
