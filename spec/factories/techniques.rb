# frozen_string_literal: true
# == Schema Information
#
# Table name: techniques
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :technique do
    title { Faker::Hacker.ingverb }
    description { Faker::Hacker.say_something_smart }
  end
end
