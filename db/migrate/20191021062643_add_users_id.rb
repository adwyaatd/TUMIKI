class AddUsersId < ActiveRecord::Migration[5.0]
  def change
  	add_column :goals, :users_id, :integer
  end
end
