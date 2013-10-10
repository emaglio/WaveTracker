require 'test_helper'

class WetsuitesControllerTest < ActionController::TestCase
  setup do
    @wetsuite = wetsuites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wetsuites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wetsuite" do
    assert_difference('Wetsuite.count') do
      post :create, wetsuite: {  }
    end

    assert_redirected_to wetsuite_path(assigns(:wetsuite))
  end

  test "should show wetsuite" do
    get :show, id: @wetsuite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wetsuite
    assert_response :success
  end

  test "should update wetsuite" do
    patch :update, id: @wetsuite, wetsuite: {  }
    assert_redirected_to wetsuite_path(assigns(:wetsuite))
  end

  test "should destroy wetsuite" do
    assert_difference('Wetsuite.count', -1) do
      delete :destroy, id: @wetsuite
    end

    assert_redirected_to wetsuites_path
  end
end
