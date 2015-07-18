class FavoriteDrink < ActiveRecord::Base
  belongs_to :drink
  belongs_to :user

  validates :user_id, presence: true
  validates :drink_id, presence:  true
end
