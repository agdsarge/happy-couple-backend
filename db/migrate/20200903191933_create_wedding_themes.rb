class CreateWeddingThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :wedding_themes do |t|
      t.string :main_color
      t.string :dark_shadow
      t.string :dark_accent
      t.string :highlight
      t.string :light_accent
      t.string :font_family
      t.string :theme_name

      t.timestamps
    end
  end
end
