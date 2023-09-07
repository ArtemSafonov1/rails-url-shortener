# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :short_url
      t.integer :clicked, default: 0
    end
    add_index :links, :short_url, unique: true
  end
end
