# frozen_string_literal: true

# == Schema Information
#
# Table name: ingredients
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.ingredient }
    description { Faker::Lorem.sentence }
  end
end
