# frozen_string_literal: true

json.extract! recipe_step, :id, :recipe_id, :stepable_id, :position, :created_at, :updated_at
json.url recipe_step_url(recipe_step, format: :json)
