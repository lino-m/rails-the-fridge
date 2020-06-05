require 'json'
require 'open-uri'

# Message to User
puts 'CLEAR DB: Clearing previous seeds'
# Deleting all ingredients
Ingredient.delete_all

# Seeding ingredients
puts 'SEEDING INGREDIENTS: Accessing URL and parsing ingredients'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
doc = open(url).read
drinks = JSON.parse(doc)
ingredients = drinks['drinks']
ingredients.each { |hash| Ingredient.create(name: hash['strIngredient1']) }

puts 'INGREDIENTS SEEDING: Completed'
