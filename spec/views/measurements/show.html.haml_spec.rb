# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "measurements/show", type: :view do
  before(:each) do
    @measurement = assign(:measurement, Measurement.create!(
      :step_ingredient => nil,
      :unit => "Unit",
      :scalar => 2.5,
      :purpose => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Unit/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/MyText/)
  end
end
