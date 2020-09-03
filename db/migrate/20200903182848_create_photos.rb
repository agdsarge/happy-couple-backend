class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :album_id
      t.string :caption

      t.timestamps
    end
  end
end
