# frozen_string_literal: true

class CreateTechniques < ActiveRecord::Migration[5.2]
  def change
    create_table :techniques do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
