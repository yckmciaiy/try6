require 'test_helper'

class ExtraParamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extra_param = extra_params(:one)
  end

  test "should get index" do
    get extra_params_url
    assert_response :success
  end

  test "should get new" do
    get new_extra_param_url
    assert_response :success
  end

  test "should create extra_param" do
    assert_difference('ExtraParam.count') do
      post extra_params_url, params: { extra_param: { formula_id: @extra_param.formula_id, title: @extra_param.title, weight: @extra_param.weight } }
    end

    assert_redirected_to extra_param_url(ExtraParam.last)
  end

  test "should show extra_param" do
    get extra_param_url(@extra_param)
    assert_response :success
  end

  test "should get edit" do
    get edit_extra_param_url(@extra_param)
    assert_response :success
  end

  test "should update extra_param" do
    patch extra_param_url(@extra_param), params: { extra_param: { formula_id: @extra_param.formula_id, title: @extra_param.title, weight: @extra_param.weight } }
    assert_redirected_to extra_param_url(@extra_param)
  end

  test "should destroy extra_param" do
    assert_difference('ExtraParam.count', -1) do
      delete extra_param_url(@extra_param)
    end

    assert_redirected_to extra_params_url
  end
end
