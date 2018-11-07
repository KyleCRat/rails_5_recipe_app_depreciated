# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "techniques/edit", type: :view do
  before(:each) do
    @technique = assign(:technique, Technique.create!(
      :name => "MyString",
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit technique form" do
    render

    assert_select "form[action=?][method=?]", technique_path(@technique), "post" do

      assert_select "input[name=?]", "technique[name]"

      assert_select "input[name=?]", "technique[title]"

      assert_select "input[name=?]", "technique[description]"
    end
  end
end
