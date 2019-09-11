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

FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    description { Faker::Food.description }

    transient do
      steps_count { Faker::Number.between(1, 6) }
      techniques_count { Faker::Number.between(1, 2) }
    end

    after(:create) do |recipe, eval|
      create_list(:step,
                  eval.steps_count,
                  recipes: [recipe])
      create_list(:technique,
                  eval.techniques_count,
                  recipes: [recipe])
    end

    factory :recipe_with_recipe do
      after(:create) do |recipe|
        recipe.recipes << create(:recipe)
      end
    end
  end
end
