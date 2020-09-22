class RemoveWeddingDateFromWeddings < ActiveRecord::Migration[6.0]
  def change
    remove_column :weddings, :wedding_date, :date
  end
end
