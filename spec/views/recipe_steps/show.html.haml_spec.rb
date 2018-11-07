# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "recipe_steps/show", type: :view do
  before(:each) do
    @recipe_step = assign(:recipe_step, RecipeStep.create!(
      :recipe => nil,
      :stepable => nil,
      :position => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
