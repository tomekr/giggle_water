require 'test_helper'

class FavoriteDrinkTest < ActiveSupport::TestCase
  test "favorite must have a user id" do
    user = User.new
    favorite_drink = user.favorite_drinks.new
    assert favorite_drink.invalid?
    assert favorite_drink.errors[:user_id].any?
  end

  test "favorite must have a drink id" do
    user = User.new
    favorite_drink = user.favorite_drinks.new
    assert favorite_drink.invalid?
    assert favorite_drink.errors[:drink_id].any?
  end
end
