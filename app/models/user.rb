#TODO This doesn't belong here, stop being lazy
require 'set'

class User < ActiveRecord::Base
  has_many :bars

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
    self.bars.find(self.current_bar_id)
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

  def makeable_drinks
    current_ingredients = Set.new(self.current_bar.bar_items.map{|bar_item| bar_item.ingredient})

    drinks_hash = {}

    Drink.all.each do |drink|
      drink_ingredients = Set.new(drink.drink_items.map{|drink_item| drink_item.ingredient})

      missing_ingredients = (drink_ingredients - current_ingredients)

      drinks_hash[missing_ingredients.size] ||= []
      drinks_hash[missing_ingredients.size] << {name: drink.name, missing_ingredients: missing_ingredients.to_a}
    end

    drinks_hash
  end
end
