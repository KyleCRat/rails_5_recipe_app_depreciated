# frozen_string_literal: true

# == Schema Information
#
# Table name: step_ingredients
#
#  id            :bigint(8)        not null, primary key
#  step_id       :bigint(8)
#  ingredient_id :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


# StepIngredient is the through record for Steps to Ingredients. This also
#   relates measurements to the ingredient on the step.
class StepIngredient < ApplicationRecord
  belongs_to :step
  belongs_to :ingredient

  has_many   :measurements
end
