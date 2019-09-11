# frozen_string_literal: true

# == Schema Information
#
# Table name: recipe_steps
#
#  id            :bigint           not null, primary key
#  recipe_id     :bigint
#  stepable_type :string
#  stepable_id   :bigint
#  position      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :recipe_step do
    recipe { nil }
    stepable { nil }
  end
end
