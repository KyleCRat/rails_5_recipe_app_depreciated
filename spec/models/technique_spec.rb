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

require 'rails_helper'

RSpec.describe Technique, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
