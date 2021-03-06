require 'csv'

DRINKS_CSV = "pdt.csv"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Populate drink database from PDT export

drinks = {}
CSV.foreach(DRINKS_CSV, {:headers => true}).each do |row|
  if drinks[row["Drink"]]
    drinks[row["Drink"]][:drink_items] << {name: row["Ingredient"],
                                          amount: row["Amount"],
                                          ingredient_use: row["IngredientUse"]}

  else
    drink_name = row["Drink"]
    drinks[drink_name] = {}
    drinks[drink_name][:glass]      = row["Glass"]
    drinks[drink_name][:directions] = row["HowToMix"]
    drinks[drink_name][:drink_items] = []
    drinks[drink_name][:drink_items] << {name: row["Ingredient"],
                                          amount: row["Amount"],
                                          ingredient_use: row["IngredientUse"]}
  end
end

puts "Importing Drinks from #{DRINKS_CSV}"
drinks.each do |drink_name, attributes|
  print "."
  drink = Drink.create(name: drink_name, glass: attributes[:glass], directions: attributes[:directions])


  attributes[:drink_items].each do |drink_item|
    Ingredient.create(name: drink_item[:name]) unless Ingredient.find_by_name(drink_item[:name])
    ingredient = Ingredient.find_by_name(drink_item[:name])

    drink.drink_items.build(ingredient: ingredient, amount: drink_item[:amount], ingredient_use: drink_item[:ingredient_use])
  end
  drink.save
end
puts "done"
