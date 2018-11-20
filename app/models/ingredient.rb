# frozen_string_literal: true
# == Schema Information
#
# Table name: ingredients
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Ingredient's are included in recipes through the recipe's steps.
class Ingredient < ApplicationRecord
  has_many :step_ingredients
  has_many :steps, through: :step_ingredients
end
