class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.string :year, null: false
      t.string :director
      t.string :main_star
      t.string :description
      t.integer :favorited, default: 0
      t.string :genres, array: true, default: []

      t.timestamps
    end
  end
end
