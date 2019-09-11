# frozen_string_literal: true
# == Schema Information
#
# Table name: ingredients
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Ingredient's are included in recipes through the recipe's steps.
class Ingredient < ApplicationRecord
  validates_presence_of :title

  has_many :step_ingredients, dependent: :destroy
  has_many :steps, through: :step_ingredients
end
