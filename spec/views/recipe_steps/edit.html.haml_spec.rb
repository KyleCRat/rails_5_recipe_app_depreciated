# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "recipe_steps/edit", type: :view do
  before(:each) do
    @recipe_step = assign(:recipe_step, RecipeStep.create!(
      :recipe => nil,
      :stepable => nil,
      :position => 1
    ))
  end

  it "renders the edit recipe_step form" do
    render

    assert_select "form[action=?][method=?]", recipe_step_path(@recipe_step), "post" do

      assert_select "input[name=?]", "recipe_step[recipe_id]"

      assert_select "input[name=?]", "recipe_step[stepable_id]"

      assert_select "input[name=?]", "recipe_step[position]"
    end
  end
end
