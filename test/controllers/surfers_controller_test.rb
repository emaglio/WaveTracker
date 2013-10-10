require 'test_helper'

class SurfersControllerTest < ActionController::TestCase
  setup do
    @surfer = surfers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:surfers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create surfer" do
    assert_difference('Surfer.count') do
      post :create, surfer: {  }
    end

    assert_redirected_to surfer_path(assigns(:surfer))
  end

  test "should show surfer" do
    get :show, id: @surfer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @surfer
    assert_response :success
  end

  test "should update surfer" do
    patch :update, id: @surfer, surfer: {  }
    assert_redirected_to surfer_path(assigns(:surfer))
  end

  test "should destroy surfer" do
    assert_difference('Surfer.count', -1) do
      delete :destroy, id: @surfer
    end

    assert_redirected_to surfers_path
  end
end
