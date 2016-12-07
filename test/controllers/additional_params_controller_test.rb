require 'test_helper'

class AdditionalParamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @additional_param = additional_params(:one)
  end

  test "should get index" do
    get additional_params_url
    assert_response :success
  end

  test "should get new" do
    get new_additional_param_url
    assert_response :success
  end

  test "should create additional_param" do
    assert_difference('AdditionalParam.count') do
      post additional_params_url, params: { additional_param: { formula_id: @additional_param.formula_id } }
    end

    assert_redirected_to additional_param_url(AdditionalParam.last)
  end

  test "should show additional_param" do
    get additional_param_url(@additional_param)
    assert_response :success
  end

  test "should get edit" do
    get edit_additional_param_url(@additional_param)
    assert_response :success
  end

  test "should update additional_param" do
    patch additional_param_url(@additional_param), params: { additional_param: { formula_id: @additional_param.formula_id } }
    assert_redirected_to additional_param_url(@additional_param)
  end

  test "should destroy additional_param" do
    assert_difference('AdditionalParam.count', -1) do
      delete additional_param_url(@additional_param)
    end

    assert_redirected_to additional_params_url
  end
end
