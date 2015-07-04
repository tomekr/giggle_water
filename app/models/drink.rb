class Drink < ActiveRecord::Base
  has_many :drink_items, dependent: :destroy

  has_many :favorite_drinks

  validates :name, presence: true, uniqueness: true
  validates :directions, presence: true
end
