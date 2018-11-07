# frozen_string_literal: true

class CreateRecipeSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_steps do |t|
      t.references :recipe,
                   foreign_key: true

      t.references :stepable,
                   polymorphic: true,
                   index: true

      t.integer :position

      t.timestamps
    end
  end
end
