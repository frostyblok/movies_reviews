class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.string :director
      t.jsonb :actors, null: false, default: []
      t.jsonb :filming_locations, null: false, default: []
      t.jsonb :countries, null: false, default: []

      t.timestamps
    end
  end
end
