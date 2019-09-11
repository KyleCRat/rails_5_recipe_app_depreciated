# frozen_string_literal: true
# == Schema Information
#
# Table name: step_ingredients
#
#  id            :bigint           not null, primary key
#  step_id       :bigint
#  ingredient_id :bigint
#  technique_id  :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe StepIngredient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
