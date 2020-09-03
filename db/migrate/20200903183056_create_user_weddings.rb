class CreateUserWeddings < ActiveRecord::Migration[6.0]
  def change
    create_table :user_weddings do |t|
      t.integer :wedding_id
      t.integer :user_id
      t.boolean :is_admin
      t.integer :accommodation_id
      t.integer :attending_status

      t.timestamps
    end
  end
end
