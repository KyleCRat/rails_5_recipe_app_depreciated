# frozen_string_literal: true
# == Schema Information
#
# Table name: steps
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Step, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
