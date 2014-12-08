class AddInitialColumns < ActiveRecord::Migration
  def change
    t.string :name
    t.text :description
    t.integer :price
  end
end
