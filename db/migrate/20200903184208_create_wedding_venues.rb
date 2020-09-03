class CreateWeddingVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :wedding_venues do |t|
      t.integer :wedding_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
