require 'test_helper'

class DrinkItemTest < ActiveSupport::TestCase
  test "drink item amount must not be empty" do
    drink_item = DrinkItem.new
    assert drink_item.invalid?
    assert drink_item.errors[:amount].any?
  end
end
