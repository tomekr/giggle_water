class Drink < ActiveRecord::Base
  has_many :drink_items, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :directions, presence: true
end
