class CreateUserPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_photos do |t|
      t.integer :photo_id
      t.integer :user_id

      t.timestamps
    end
  end
end
