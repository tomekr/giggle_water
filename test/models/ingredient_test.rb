require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  test "ingredient name must not be empty" do
    ingredient = Ingredient.new
    assert ingredient.invalid?
    assert ingredient.errors[:name].any?
  end

  test "ingredient is not valid without a unique name" do
    ingredient = Ingredient.new(name: ingredients(:beefeater).name)

    assert ingredient.invalid?
    assert_equal ["has already been taken"], ingredient.errors[:name]
  end
end
