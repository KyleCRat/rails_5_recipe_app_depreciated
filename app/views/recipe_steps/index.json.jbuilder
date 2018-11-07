# frozen_string_literal: true

json.array! @recipe_steps, partial: 'recipe_steps/recipe_step', as: :recipe_step
