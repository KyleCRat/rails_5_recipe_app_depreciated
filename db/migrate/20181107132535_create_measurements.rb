# frozen_string_literal: true

class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      t.references :step_ingredient, foreign_key: true
      t.string :unit
      t.decimal :scalar
      t.text :purpose

      t.timestamps
    end
  end
end
