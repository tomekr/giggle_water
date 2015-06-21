class DrinkItem < ActiveRecord::Base
  belongs_to :ingredient, counter_cache: true
  belongs_to :drink

  validates :amount, presence: true
end
