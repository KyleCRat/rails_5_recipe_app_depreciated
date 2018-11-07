# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "techniques/new", type: :view do
  before(:each) do
    assign(:technique, Technique.new(
      :name => "MyString",
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new technique form" do
    render

    assert_select "form[action=?][method=?]", techniques_path, "post" do

      assert_select "input[name=?]", "technique[name]"

      assert_select "input[name=?]", "technique[title]"

      assert_select "input[name=?]", "technique[description]"
    end
  end
end
