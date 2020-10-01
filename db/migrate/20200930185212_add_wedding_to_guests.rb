class AddWeddingToGuests < ActiveRecord::Migration[6.0]
  def change
    add_reference :guests, :wedding, null: false, foreign_key: true
  end
end
