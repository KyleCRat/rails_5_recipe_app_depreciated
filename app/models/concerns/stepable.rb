# frozen_string_literal: true

# Adds the polymorphic relation to recipes through through_steps
module Stepable
  extend ActiveSupport::Concern

  included do
    has_many :through_steps, as: :stepable, class_name: 'RecipeStep'
    has_many :recipes, through: :through_steps
  end
end
