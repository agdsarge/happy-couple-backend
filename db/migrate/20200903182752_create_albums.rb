class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.integer :wedding_id
      t.string :title
      t.boolean :is_bio

      t.timestamps
    end
  end
end
