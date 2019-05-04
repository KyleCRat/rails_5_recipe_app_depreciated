# frozen_string_literal: true

module RecipesHelper
  def render_combined_ingredients(recipe, form)
    html = []

    ingredient_groups = recipe.all_ingredients.group_by { |si| si.ingredient.title }

    ingredient_groups.sort.each do |_title, group|
      step_ingredient = group.first.dup
      step_ingredient.measurements = []
      step_ingredient.technique = nil if group.many?

      group.each do |ingredient|
        ingredient.measurements.each do |measurement|
          step_ingredient.measurements << measurement
        end
      end

      html << render(step_ingredient, f: form)
    end

    html.sort.join.html_safe
  end
end
