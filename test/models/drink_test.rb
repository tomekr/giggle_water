require 'test_helper'

class DrinkTest < ActiveSupport::TestCase
  test "drink attributes must not be empty" do
    drink = Drink.new
    assert drink.invalid?
    assert drink.errors[:name].any?
    assert drink.errors[:directions].any?
  end

  test "drink name must not be unique" do
    drink = Drink.new(name: drinks(:last_word).name)

    assert drink.invalid?
    assert_equal ["has already been taken"], drink.errors[:name]
  end
end
