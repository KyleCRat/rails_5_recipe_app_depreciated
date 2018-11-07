# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "measurements/index", type: :view do
  before(:each) do
    assign(:measurements, [
      Measurement.create!(
        :step_ingredient => nil,
        :unit => "Unit",
        :scalar => 2.5,
        :purpose => "MyText"
      ),
      Measurement.create!(
        :step_ingredient => nil,
        :unit => "Unit",
        :scalar => 2.5,
        :purpose => "MyText"
      )
    ])
  end

  it "renders a list of measurements" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
