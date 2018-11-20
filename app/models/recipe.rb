# frozen_string_literal: true

# == Schema Information
#
# Table name: recipes
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Recipe's are containers that can have as many Steps, Techniques, or even
#   other Recipes within them.
class Recipe < ApplicationRecord
  include Stepable

  has_many :recipe_steps, dependent: :destroy
  has_many :steps,
           through: :recipe_steps,
           source: 'stepable',
           source_type: 'Step',
           dependent: :destroy
  has_many :techniques,
           through: :recipe_steps,
           source: 'stepable',
           source_type: 'Technique'
  has_many :recipes,
           through: :recipe_steps,
           source: 'stepable',
           source_type: 'Recipe'
  has_many :ingredients,
           through: :steps
  has_many :step_ingredients,
           through: :steps
end
