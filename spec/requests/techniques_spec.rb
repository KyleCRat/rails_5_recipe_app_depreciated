# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Techniques", type: :request do
  describe "GET /techniques" do
    it "works! (now write some real specs)" do
      get techniques_path
      expect(response).to have_http_status(200)
    end
  end
end
