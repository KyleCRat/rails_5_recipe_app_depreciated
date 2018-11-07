# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "measurements/edit", type: :view do
  before(:each) do
    @measurement = assign(:measurement, Measurement.create!(
      :step_ingredient => nil,
      :unit => "MyString",
      :scalar => 1.5,
      :purpose => "MyText"
    ))
  end

  it "renders the edit measurement form" do
    render

    assert_select "form[action=?][method=?]", measurement_path(@measurement), "post" do

      assert_select "input[name=?]", "measurement[step_ingredient_id]"

      assert_select "input[name=?]", "measurement[unit]"

      assert_select "input[name=?]", "measurement[scalar]"

      assert_select "textarea[name=?]", "measurement[purpose]"
    end
  end
end
