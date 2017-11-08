require 'test_helper'

class ExecutedChoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @executed_chore = executed_chores(:one)
  end

  test "should get index" do
    get executed_chores_url
    assert_response :success
  end

  test "should get new" do
    get new_executed_chore_url
    assert_response :success
  end

  test "should create executed_chore" do
    assert_difference('ExecutedChore.count') do
      post executed_chores_url, params: { executed_chore: { chore_id: @executed_chore.chore_id, user_id: @executed_chore.user_id } }
    end

    assert_redirected_to executed_chore_url(ExecutedChore.last)
  end

  test "should show executed_chore" do
    get executed_chore_url(@executed_chore)
    assert_response :success
  end

  test "should get edit" do
    get edit_executed_chore_url(@executed_chore)
    assert_response :success
  end

  test "should update executed_chore" do
    patch executed_chore_url(@executed_chore), params: { executed_chore: { chore_id: @executed_chore.chore_id, user_id: @executed_chore.user_id } }
    assert_redirected_to executed_chore_url(@executed_chore)
  end

  test "should destroy executed_chore" do
    assert_difference('ExecutedChore.count', -1) do
      delete executed_chore_url(@executed_chore)
    end

    assert_redirected_to executed_chores_url
  end
end
