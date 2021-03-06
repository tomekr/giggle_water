require 'test_helper'

class IngredientsControllerTest < ActionController::TestCase
  setup do
    @ingredient = ingredients(:tanqueray)
    sign_in users (:bob)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredient" do
    skip("Functionality to be added later.")
    assert_difference('Ingredient.count') do
      post :create, ingredient: { :ingredient => @ingredient }
    end

    assert_redirected_to ingredient_path(assigns(:ingredient))
  end

  test "should show ingredient" do
    get :show, id: @ingredient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingredient
    assert_response :success
  end

  test "should update ingredient" do
    skip("Functionality to be added later.")
    patch :update, id: @ingredient, ingredient: {  }
    assert_redirected_to ingredient_path(assigns(:ingredient))
  end

  test "should destroy ingredient" do
    skip("Functionality to be added later.")
    assert_difference('Ingredient.count', -1) do
      delete :destroy, id: @ingredient
    end

    assert_redirected_to ingredients_path
  end
end
