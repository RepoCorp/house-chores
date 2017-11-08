require 'test_helper'

class ScheduledChoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduled_chore = scheduled_chores(:one)
  end

  test "should get index" do
    get scheduled_chores_url
    assert_response :success
  end

  test "should get new" do
    get new_scheduled_chore_url
    assert_response :success
  end

  test "should create scheduled_chore" do
    assert_difference('ScheduledChore.count') do
      post scheduled_chores_url, params: { scheduled_chore: { chore_id: @scheduled_chore.chore_id, friday: @scheduled_chore.friday, monday: @scheduled_chore.monday, saturday: @scheduled_chore.saturday, sunday: @scheduled_chore.sunday, thursday: @scheduled_chore.thursday, tuesday: @scheduled_chore.tuesday, user_id: @scheduled_chore.user_id, wednesday: @scheduled_chore.wednesday } }
    end

    assert_redirected_to scheduled_chore_url(ScheduledChore.last)
  end

  test "should show scheduled_chore" do
    get scheduled_chore_url(@scheduled_chore)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheduled_chore_url(@scheduled_chore)
    assert_response :success
  end

  test "should update scheduled_chore" do
    patch scheduled_chore_url(@scheduled_chore), params: { scheduled_chore: { chore_id: @scheduled_chore.chore_id, friday: @scheduled_chore.friday, monday: @scheduled_chore.monday, saturday: @scheduled_chore.saturday, sunday: @scheduled_chore.sunday, thursday: @scheduled_chore.thursday, tuesday: @scheduled_chore.tuesday, user_id: @scheduled_chore.user_id, wednesday: @scheduled_chore.wednesday } }
    assert_redirected_to scheduled_chore_url(@scheduled_chore)
  end

  test "should destroy scheduled_chore" do
    assert_difference('ScheduledChore.count', -1) do
      delete scheduled_chore_url(@scheduled_chore)
    end

    assert_redirected_to scheduled_chores_url
  end
end
