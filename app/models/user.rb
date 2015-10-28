#TODO This doesn't belong here, stop being lazy
require 'set'

class User < ActiveRecord::Base
  has_many :bars

  has_many :favorite_drinks
  has_many :favorites, through: :favorite_drinks, source: :drink

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def current_bar
    if self.bars.empty?
      return nil
    else
      self.bars.find(self.current_bar_id)
    end
  end

  def set_current_bar(bar_id)
    self.current_bar_id = bar_id
    self.save
  end

  def drinks_user_can_make
    current_ingredients = Set.new(self.current_bar.bar_items.map{|bar_item| bar_item.ingredient})

    makeable_drinks = []
    Drink.all.each do |drink|
      drink_ingredients = Set.new(drink.drink_items.map{|drink_item| drink_item.ingredient})

      makeable_drinks << drink if (drink_ingredients - current_ingredients).empty?
    end

    makeable_drinks
  end
# default to nil, value will come from controller
  def makeable_drinks(missing_count=nil)
    # Return an empty hash if the user doesn't have any bars or somehow the
    # current bar wasn't set
    return {} unless self.current_bar

    current_ingredients = Set.new(self.current_bar.bar_items.map{|bar_item| bar_item.ingredient})

    drinks_hash = {}

    Drink.all.each do |drink|
      drink_ingredients = Set.new(drink.drink_items.map{|drink_item| drink_item.ingredient})

      missing_ingredients = (drink_ingredients - current_ingredients)
      
      if missing_count
        if missing_ingredients.size <= missing_count
          drinks_hash[missing_ingredients.size] ||= []
          drinks_hash[missing_ingredients.size] << {name: drink.name, id: drink.id, missing_ingredients: missing_ingredients.to_a}
       end
      else
        drinks_hash[missing_ingredients.size] ||= []
        drinks_hash[missing_ingredients.size] << {name: drink.name, id: drink.id, missing_ingredients: missing_ingredients.to_a}
      end
    end

    drinks_hash
  end
end
