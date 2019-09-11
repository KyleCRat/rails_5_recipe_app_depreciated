# frozen_string_literal: true
# == Schema Information
#
# Table name: techniques
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Techniques are included in Recipe's to help display ways of achieveing goals.
#   Examples:
#     Pan Searing Chicken
#     Sharpening Knives
class Technique < ApplicationRecord
  include Stepable

  validates_presence_of :title
end
