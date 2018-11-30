# frozen_string_literal: true
# == Schema Information
#
# Table name: steps
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Step is the main way of giving purpose to a recipe. Step's have many
#   Ingredients and list how those ingredients are used. A step should be a list
#   of instructions on how to use all the ingredients associated with the step.
class Step < ApplicationRecord
  include Stepable

  has_many :step_ingredients
  has_many :measurements, through: :step_ingredients
  has_many :ingredients, through: :step_ingredients

  accepts_nested_attributes_for :step_ingredients,
                                reject_if: :all_blank,
                                allow_destroy: true
end
