class RemoveLatitudeFromWedding < ActiveRecord::Migration[6.0]
  def change
    remove_column :weddings, :latitude, :float
  end
end
