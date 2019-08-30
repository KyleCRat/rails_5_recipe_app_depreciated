# frozen_string_literal: true
# == Schema Information
#
# Table name: step_ingredients
#
#  id            :bigint           not null, primary key
#  step_id       :bigint
#  ingredient_id :bigint
#  technique_id  :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

# StepIngredient is the through record for Steps to Ingredients. This also
#   relates measurements to the ingredient on the step.
class StepIngredient < ApplicationRecord
  belongs_to :step
  belongs_to :ingredient
  belongs_to :technique, required: false

  has_many   :measurements, dependent: :destroy

  accepts_nested_attributes_for :measurements,
                                :ingredient,
                                :technique,
                                # reject_if: :all_blank,
                                allow_destroy: true

  def total_measurement
    value = measurements.inject(0) do |v, m|
      v + m.to_unit
    end

    value.convert_to(value.base) unless measurements.collect(&:to_unit).collect(&:units).uniq.one?
    value
  end
end
