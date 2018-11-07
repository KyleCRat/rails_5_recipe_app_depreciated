# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "recipes/new", type: :view do
  before(:each) do
    assign(:recipe, Recipe.new(
      :name => "MyString",
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new recipe form" do
    render

    assert_select "form[action=?][method=?]", recipes_path, "post" do

      assert_select "input[name=?]", "recipe[name]"

      assert_select "input[name=?]", "recipe[title]"

      assert_select "textarea[name=?]", "recipe[description]"
    end
  end
end
