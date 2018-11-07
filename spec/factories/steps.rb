# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :step do
    transient do
      ingredients_count { Faker::Number.between(1, 3) }
    end

    after(:create) do |step, eval|
      create_list(:step_ingredient,
                  eval.ingredients_count,
                  step: step)
    end
  end
end
