# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :step do
    title { Faker::Food.dish }
    description { Faker::Food.description }

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
