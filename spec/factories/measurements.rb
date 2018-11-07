# frozen_string_literal: true

# == Schema Information
#
# Table name: measurements
#
#  id                 :bigint(8)        not null, primary key
#  step_ingredient_id :bigint(8)
#  unit               :string
#  scalar             :float
#  purpose            :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryBot.define do
  factory :measurement do
    step_ingredient { nil }
    unit { Faker::Food.metric_measurement }
    scalar { Faker::Number.decimal(1, 1) }
    purpose { Faker::Lorem.sentence }
  end
end
