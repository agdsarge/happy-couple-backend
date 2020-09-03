class RemoveLongitudeFromWedding < ActiveRecord::Migration[6.0]
  def change
    remove_column :weddings, :longitude, :float
  end
end
