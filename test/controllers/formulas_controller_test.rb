require 'test_helper'

class FormulasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formula = formulas(:one)
  end

  test "should get index" do
    get formulas_url
    assert_response :success
  end

  test "should get new" do
    get new_formula_url
    assert_response :success
  end

  test "should create formula" do
    assert_difference('Formula.count') do
      post formulas_url, params: { formula: { extra_params: @formula.extra_params, glicko: @formula.glicko, lose_points: @formula.lose_points, losestreak: @formula.losestreak, losestreak_boost: @formula.losestreak_boost, title: @formula.title, user_id: @formula.user_id, win_points: @formula.win_points, winstreak: @formula.winstreak, winstreak_boost: @formula.winstreak_boost } }
    end

    assert_redirected_to formula_url(Formula.last)
  end

  test "should show formula" do
    get formula_url(@formula)
    assert_response :success
  end

  test "should get edit" do
    get edit_formula_url(@formula)
    assert_response :success
  end

  test "should update formula" do
    patch formula_url(@formula), params: { formula: { extra_params: @formula.extra_params, glicko: @formula.glicko, lose_points: @formula.lose_points, losestreak: @formula.losestreak, losestreak_boost: @formula.losestreak_boost, title: @formula.title, user_id: @formula.user_id, win_points: @formula.win_points, winstreak: @formula.winstreak, winstreak_boost: @formula.winstreak_boost } }
    assert_redirected_to formula_url(@formula)
  end

  test "should destroy formula" do
    assert_difference('Formula.count', -1) do
      delete formula_url(@formula)
    end

    assert_redirected_to formulas_url
  end
end
