# frozen_string_literal: true

json.extract! measurement, :id, :step_ingredient_id, :unit, :scalar, :purpose, :created_at, :updated_at
json.url measurement_url(measurement, format: :json)
