# frozen_string_literal: true

# == Schema Information
#
# Table name: ingredients
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :ingredient do
    title { Faker::Food.ingredient }
    description { Faker::Lorem.sentence }
  end
end
