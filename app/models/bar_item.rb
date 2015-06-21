class BarItem < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :bar
end
