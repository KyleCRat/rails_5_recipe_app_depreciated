# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "techniques/show", type: :view do
  before(:each) do
    @technique = assign(:technique, Technique.create!(
      :name => "Name",
      :title => "Title",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
  end
end
