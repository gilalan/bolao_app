require 'test_helper'

class MatchResultsControllerTest < ActionController::TestCase
  setup do
    @match_result = match_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:match_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match_result" do
    assert_difference('MatchResult.count') do
      post :create, match_result: { game_id: @match_result.game_id, goals: @match_result.goals, team_id: @match_result.team_id }
    end

    assert_redirected_to match_result_path(assigns(:match_result))
  end

  test "should show match_result" do
    get :show, id: @match_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @match_result
    assert_response :success
  end

  test "should update match_result" do
    put :update, id: @match_result, match_result: { game_id: @match_result.game_id, goals: @match_result.goals, team_id: @match_result.team_id }
    assert_redirected_to match_result_path(assigns(:match_result))
  end

  test "should destroy match_result" do
    assert_difference('MatchResult.count', -1) do
      delete :destroy, id: @match_result
    end

    assert_redirected_to match_results_path
  end
end
