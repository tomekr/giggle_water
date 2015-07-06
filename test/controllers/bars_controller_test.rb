require 'test_helper'

class BarsControllerTest < ActionController::TestCase
  setup do
    @bar = bars(:one)
  end

  test "created bar should be user's current bar if user's current bar is nil" do
    #TODO write this test
    # After a bar is created, that bar should be automatically set as the user's
    # current_bar_id if they don't currently have a bar set
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bar" do
    assert_difference('Bar.count') do
      post :create, bar: { name: @bar.name }
    end

    assert_redirected_to bar_path(assigns(:bar))
  end

  test "should show bar" do
    get :show, id: @bar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bar
    assert_response :success
  end

  test "should update bar" do
    patch :update, id: @bar, bar: { name: @bar.name }
    assert_redirected_to bar_path(assigns(:bar))
  end

  test "should destroy bar" do
    assert_difference('Bar.count', -1) do
      delete :destroy, id: @bar
    end

    assert_redirected_to bars_path
  end
end
