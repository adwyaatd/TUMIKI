class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :content
      t.integer :user_id
      t.string :user_name

      t.timestamps
    end
  end
end
