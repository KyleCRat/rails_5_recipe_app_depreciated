# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "recipe_steps/index", type: :view do
  before(:each) do
    assign(:recipe_steps, [
      RecipeStep.create!(
        :recipe => nil,
        :stepable => nil,
        :position => 2
      ),
      RecipeStep.create!(
        :recipe => nil,
        :stepable => nil,
        :position => 2
      )
    ])
  end

  it "renders a list of recipe_steps" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
