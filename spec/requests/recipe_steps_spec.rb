# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "RecipeSteps", type: :request do
  describe "GET /recipe_steps" do
    it "works! (now write some real specs)" do
      get recipe_steps_path
      expect(response).to have_http_status(200)
    end
  end
end
