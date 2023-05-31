class FamouseRecipeCityController < ApplicationController
    
    def create
      @recipe = Recipe.find(params[:recipe_id])
      @famouse_recipe_city = @recipe.build_famouse_recipe_city(famouse_recipe_city_params)
      if @famouse_recipe_city.save
        redirect_to @recipe  
      else
        notice: "No famouse city"
      end
    end

    private
    def famouse_recipe_city_params
       params.require(:famouse_recipe_city).permit(:place, :city, :recipe_id)
    end
end
