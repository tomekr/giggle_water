require 'test_helper'

class DrinkItemTest < ActiveSupport::TestCase
  test "has a drink_id" do
    drink_item = drink_items(:one)
    assert drink_item.drink_id?
  end

  test "has an ingredient_id" do
    drink_item = drink_items(:two)
    assert drink_item.ingredient_id?
  end
end
