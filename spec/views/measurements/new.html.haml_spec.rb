# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "measurements/new", type: :view do
  before(:each) do
    assign(:measurement, Measurement.new(
      :step_ingredient => nil,
      :unit => "MyString",
      :scalar => 1.5,
      :purpose => "MyText"
    ))
  end

  it "renders new measurement form" do
    render

    assert_select "form[action=?][method=?]", measurements_path, "post" do

      assert_select "input[name=?]", "measurement[step_ingredient_id]"

      assert_select "input[name=?]", "measurement[unit]"

      assert_select "input[name=?]", "measurement[scalar]"

      assert_select "textarea[name=?]", "measurement[purpose]"
    end
  end
end
