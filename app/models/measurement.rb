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


# Measurement is a Unit and Sacalar that associates with a ingredient to display
#   how much of something is necessary.
class Measurement < ApplicationRecord
  belongs_to :step_ingredient

  def to_unit
    Unit.new("#{scalar} #{unit}")
  end
end
