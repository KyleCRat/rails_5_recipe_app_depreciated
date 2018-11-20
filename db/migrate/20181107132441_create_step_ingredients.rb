# frozen_string_literal: true

class CreateStepIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :step_ingredients do |t|
      t.references :step, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.references :technique, foreign_key: true

      t.timestamps
    end
  end
end
