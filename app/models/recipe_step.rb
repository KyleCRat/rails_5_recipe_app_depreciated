# frozen_string_literal: true

# == Schema Information
#
# Table name: recipe_steps
#
#  id            :bigint(8)        not null, primary key
#  recipe_id     :bigint(8)
#  stepable_type :string
#  stepable_id   :bigint(8)
#  position      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


# RecipeStep is the through table for relating polymorphic stepable items to
#   the recipe.
class RecipeStep < ApplicationRecord
  belongs_to :stepable, polymorphic: true
  belongs_to :recipe

  before_create :set_position

  private

  def set_position
    self.position = recipe.recipe_steps.count + 1
  end
end
