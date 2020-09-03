class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.string :title
      t.string :body
      t.integer :wedding_id

      t.timestamps
    end
  end
end
