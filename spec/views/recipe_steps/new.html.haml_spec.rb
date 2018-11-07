# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "recipe_steps/new", type: :view do
  before(:each) do
    assign(:recipe_step, RecipeStep.new(
      :recipe => nil,
      :stepable => nil,
      :position => 1
    ))
  end

  it "renders new recipe_step form" do
    render

    assert_select "form[action=?][method=?]", recipe_steps_path, "post" do

      assert_select "input[name=?]", "recipe_step[recipe_id]"

      assert_select "input[name=?]", "recipe_step[stepable_id]"

      assert_select "input[name=?]", "recipe_step[position]"
    end
  end
end
