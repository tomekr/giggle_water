require 'test_helper'

class BarItemsControllerTest < ActionController::TestCase
  setup do
    @bar_item = bar_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bar_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bar_item" do
    assert_difference('BarItem.count') do
      post :create, bar_item: { bar_id: @bar_item.bar_id, ingredient_id: @bar_item.ingredient_id }
    end

    assert_redirected_to bar_item_path(assigns(:bar_item))
  end

  test "should show bar_item" do
    get :show, id: @bar_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bar_item
    assert_response :success
  end

  test "should update bar_item" do
    patch :update, id: @bar_item, bar_item: { bar_id: @bar_item.bar_id, ingredient_id: @bar_item.ingredient_id }
    assert_redirected_to bar_item_path(assigns(:bar_item))
  end

  test "should destroy bar_item" do
    assert_difference('BarItem.count', -1) do
      delete :destroy, id: @bar_item
    end

    assert_redirected_to bar_items_path
  end
end
