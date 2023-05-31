class Recipe < ApplicationRecord
    # enum dish_type: { main: 0, dessert: 1, drink: 2 }
    has_one :famouse_recipe_city
end
