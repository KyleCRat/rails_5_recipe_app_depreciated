# frozen_string_literal: true
# == Schema Information
#
# Table name: recipes
#
#  id          :bigint(8)        not null, primary key
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
           source_type: 'Technique',
           dependent: :destroy

  has_many :recipes,
           through: :recipe_steps,
           source: 'stepable',
           source_type: 'Recipe',
           dependent: :destroy

  has_many :ingredients,
           through: :steps

  has_many :step_ingredients,
           through: :steps,
           dependent: :destroy

  accepts_nested_attributes_for :recipes,
                                :techniques,
                                :steps,
                                :recipe_steps,
                                reject_if: :all_blank,
                                allow_destroy: true
end
