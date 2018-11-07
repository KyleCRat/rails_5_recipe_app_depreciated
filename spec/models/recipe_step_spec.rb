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

require 'rails_helper'

RSpec.describe RecipeStep, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
