class CreateStyledLines < ActiveRecord::Migration[6.0]
  def change
    create_table :styled_lines do |t|
      t.integer :invitation_id
      t.integer :line_number
      t.string :text
      t.string :fontFamily
      t.string :fontSize
      t.string :color
      t.string :textAlign

      t.timestamps
    end
  end
end
