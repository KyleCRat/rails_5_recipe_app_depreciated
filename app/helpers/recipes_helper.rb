# frozen_string_literal: true

module RecipesHelper
  def render_combined_ingredients(recipe)
    html = []

    ing_groups = recipe.step_ingredients.group_by { |si| si.ingredient.title }

    ing_groups.sort.each do |_title, group|
      temp_s_ing = group.first.dup
      temp_s_ing.measurements = []

      group.each do |ingredient|
        ingredient.measurements.each do |measurement|
          temp_s_ing.measurements << measurement
        end
      end

      html << render(temp_s_ing)
    end

    html.sort.join.html_safe
  end
end
