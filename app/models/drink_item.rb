class DrinkItem < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :drink

  validates :amount, presence: true
end
