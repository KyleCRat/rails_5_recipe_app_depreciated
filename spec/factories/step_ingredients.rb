# frozen_string_literal: true

# == Schema Information
#
# Table name: step_ingredients
#
#  id            :bigint(8)        not null, primary key
#  step_id       :bigint(8)
#  ingredient_id :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :step_ingredient do
    # step { nil }
    ingredient { create(:ingredient) }

    transient do
      measurements_count { Faker::Number.between(1, 3) }
    end

    after(:create) do |step_ingredient, eval|
      create_list(:measurement,
                  eval.measurements_count,
                  step_ingredient: step_ingredient)
    end
  end
end
