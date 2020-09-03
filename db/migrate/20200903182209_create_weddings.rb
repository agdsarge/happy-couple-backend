class CreateWeddings < ActiveRecord::Migration[6.0]
  def change
    create_table :weddings do |t|
      t.float :latitude
      t.float :longitude
      t.string :registry_link
      t.date :wedding_date
      t.string :wedding_slug
      t.integer :wedding_theme_id

      t.timestamps
    end
  end
end
