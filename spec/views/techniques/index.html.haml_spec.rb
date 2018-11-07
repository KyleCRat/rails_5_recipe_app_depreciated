# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "techniques/index", type: :view do
  before(:each) do
    assign(:techniques, [
      Technique.create!(
        :name => "Name",
        :title => "Title",
        :description => "Description"
      ),
      Technique.create!(
        :name => "Name",
        :title => "Title",
        :description => "Description"
      )
    ])
  end

  it "renders a list of techniques" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
