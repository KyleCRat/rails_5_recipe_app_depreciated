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

require 'rails_helper'

RSpec.describe Measurement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
