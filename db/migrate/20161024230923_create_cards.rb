class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :artist
      t.string :color
      t.integer :rarity
      t.string :set
      t.string :imgsrc
    end
  end
end
