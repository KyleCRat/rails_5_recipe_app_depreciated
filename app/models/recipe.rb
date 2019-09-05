# frozen_string_literal: true
# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Recipe's are containers that can have as many Steps, Techniques, or even
#   other Recipes within them.
class Recipe < ApplicationRecord
  include Stepable

  has_rich_text :description

  validates_presence_of :title

  before_save :set_slug

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
                                # reject_if: :all_blank,
                                allow_destroy: true

  def all_ingredients
    ingredients = step_ingredients.to_ary

    recipes.each do |recipe|
      ingredients += recipe.all_ingredients
    end

    ingredients
  end

  def to_param
    slug
  end

  def set_slug
    0.step do |i|
      if i.zero?
        param_title = title.parameterize
      else
        param_title = "#{title.parameterize}-#{i}"
      end
      self.slug = param_title
      break unless Recipe.where(slug: slug).exists?
    end
  end
end
