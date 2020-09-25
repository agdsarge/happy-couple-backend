class CreateToDos < ActiveRecord::Migration[6.0]
  def change
    create_table :to_dos do |t|
      t.integer :wedding_id
      t.string :todo_name
      t.boolean :isCompleted

      t.timestamps
    end
  end
end
