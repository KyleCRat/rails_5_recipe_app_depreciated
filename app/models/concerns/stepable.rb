# frozen_string_literal: true

# Adds the polymorphic relation to recipes through recipe_steps
module Stepable
  extend ActiveSupport::Concern

  included do
    has_many :recipe_steps, as: :stepable
    has_many :recipes, through: :recipe_steps
  end
end
